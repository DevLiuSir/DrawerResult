//
//  DrawerViewController.swift
//  DrawerResult
//
//  Created by Liu Chuan on 2017/3/26.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit


// 菜单状态枚举
enum MenuState {
    case collapsed      // 未显示(收起)
    case expanding      // 展开中
    case expanded       // 展开
}


class DrawerViewController: UIViewController {
    
    
    /// 主页控制器
    var mainVC: MainViewController?
    
    /// 菜单页控制器
    var leftVC: LeftMenuViewController?
    
    /// 左边菜单控制器最大显示范围
    var leftWidth: CGFloat = 0

    // MARK: - 单例
    static let shareDrawer = UIApplication.shared.keyWindow?.rootViewController as? DrawerViewController
  
    /// 创建抽屉
    ///
    /// - Parameters:
    ///   - mainVC: 主控制器
    ///   - leftMenuVC: 左边控制器
    ///   - leftWidth: 左边菜单控制器最大显示范围
    init(mainVC: MainViewController, leftMenuVC: LeftMenuViewController, leftWidth: CGFloat) {
        
        super.init(nibName: nil, bundle: nil)
        
        self.mainVC = mainVC
        self.leftVC = leftMenuVC
        self.leftWidth = leftWidth
        
        // 将左边菜单控制器 和 mainVC控制器 的view, 都添加到抽屉控制器的view上
        view.addSubview(leftMenuVC.view)
        view.addSubview(mainVC.view)
        
        addChildViewController(leftMenuVC)
        addChildViewController(mainVC)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    // MARK: - 懒加载
    /// 灰色背景按钮
    private lazy var coverBtn: UIButton = {
        let btn = UIButton(frame: self.view.bounds)
        btn.backgroundColor = UIColor.clear
        btn.addTarget(self, action: #selector(closeLeftMenu(closeDrawerWithDuration:)), for: .touchUpInside)
        btn.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(panCloseLeftMenu(_:))))
        return btn
        
    }()
    

    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childVC_Add_Gesture()
        
        showShadowForMainViewController(true)
        
        
    }

    
    /// 给每个控制器添加手势
    private func childVC_Add_Gesture() {
        // 遍历控制器
        for childViewController in (mainVC?.childViewControllers)! {
            addPanGestureRecognizerToView(view: childViewController.view)
        }

    }

    //MARK: - 添加屏幕手势
    
    // 屏幕边缘手势 : UIScreenEdgePanGestureRecognizer
    private func addPanGestureRecognizerToView(view: UIView) {
        
//        let pan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgPanGesture(_:)))
//        pan.edges = UIRectEdge.left
        
         let pan = UIPanGestureRecognizer(target: self, action: #selector(edgPanGesture(_:)))
        
        view.addGestureRecognizer(pan)
    }
    

//屏幕左边缘手势
//    @objc private func edgPanGesture(_ pan: UIScreenEdgePanGestureRecognizer) {
    // MARK: - 屏幕手势
     @objc private func edgPanGesture(_ pan: UIPanGestureRecognizer) {
        
        let offsetX = pan.translation(in: pan.view).x
        
        if pan.state == UIGestureRecognizerState.changed && offsetX <= leftWidth {
            mainVC?.view.transform = CGAffineTransform(translationX: max(offsetX, 0), y: 0)
            leftVC?.view.transform = CGAffineTransform(translationX: -leftWidth + offsetX, y: 0)
            
        } else if pan.state == UIGestureRecognizerState.ended || pan.state == UIGestureRecognizerState.cancelled || pan.state == UIGestureRecognizerState.failed {
            
            if offsetX > screenW * 0.5 {
                 openLeftMenu(openDrawerWithDuration: 0.25)
            } else {
                closeLeftMenu(closeDrawerWithDuration: 0.25)
            }
        }
        
    }
    
    
    //MARK: - 遮盖按钮手势
    @objc private func panCloseLeftMenu(_ pan: UIPanGestureRecognizer) {
        
        let offsetX = pan.translation(in: pan.view).x
        if offsetX > 0 {return}
        
        if pan.state == UIGestureRecognizerState.changed && offsetX >= -leftWidth {
            
            let distace = leftWidth + offsetX
            
            mainVC?.view.transform = CGAffineTransform(translationX: distace, y: 0)
            leftVC?.view.transform = CGAffineTransform(translationX: offsetX, y: 0)
            
        } else if pan.state == UIGestureRecognizerState.ended || pan.state == UIGestureRecognizerState.cancelled || pan.state == UIGestureRecognizerState.failed {
            
            if offsetX > screenW * 0.5 {
                
                openLeftMenu(openDrawerWithDuration: 0.25)
                
            } else {
                
                closeLeftMenu(closeDrawerWithDuration: 0.25)
            }
            
        }
        
    }
    
    
    /// 打开抽屉
    func openLeftMenu(openDrawerWithDuration: CGFloat) {
        
        // curveLinear: 动画执行过程中, 匀速执行
        // usingSpringWithDamping：1.0表示没有弹簧震动动画
        UIView.animate(withDuration: TimeInterval(openDrawerWithDuration), delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveLinear, animations: {
            
            //  因为在没打开抽屉的时候，主控制的tranform是处于为偏移状态，左侧控制器是向左偏移了leftWidth的宽度
            // 所以，这里要让主控制器右偏移，左侧控制器恢复就好
            self.mainVC?.view.transform = CGAffineTransform(translationX: self.leftWidth, y: 0)
            self.leftVC?.view.transform = CGAffineTransform.identity

        }, completion: { (Bool) in
            // 添加遮盖按钮
            //  在打开抽屉效果之后，我们往主控制器上添加一个遮罩按钮，用来点击的时候关闭抽屉效果
            // 并且给遮罩按钮添加一个手势，实现通过拖动关闭抽屉
            self.mainVC?.view.addSubview(self.coverBtn)
            print("打开抽屉!!!!")
        })

    }
    
    /// 关闭抽屉
    /// 灰色背景按钮点击事件
    func closeLeftMenu(closeDrawerWithDuration: CGFloat) {
        // curveLinear: 动画执行过程中, 匀速执行
        // usingSpringWithDamping：1.0表示没有弹簧震动动画
        UIView.animate(withDuration: TimeInterval(closeDrawerWithDuration), delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveLinear, animations: {
            
            self.mainVC?.view.transform = CGAffineTransform.identity
            self.leftVC?.view.transform = CGAffineTransform(translationX: -self.leftWidth, y: 0)
            
        }, completion: { (Bool) in
            // 移除遮盖按钮
            self.coverBtn.removeFromSuperview()
            print("关闭抽屉!!!!")
        })
        
    }
    
    /// 给主页面边缘添加、取消阴影
    func showShadowForMainViewController(_ shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            mainVC?.view.layer.shadowOpacity = 0.8
        } else {
            mainVC?.view.layer.shadowOpacity = 0.0
        }
    }
    
    
}
