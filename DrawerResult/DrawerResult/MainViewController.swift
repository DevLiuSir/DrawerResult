//
//  MainViewController.swift
//  DrawerResult
//
//  Created by Liu Chuan on 2017/3/25.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    
    /// 主页面控制器
//    var drawerViewController: DrawerViewController!
    
    /// 菜单页控制器
//    var messageViewController = MessageViewController()
//    var leftMenuViewController = LeftMenuViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

//    
//    
//    @objc private func showMenu() {
//        
//        print(#function)
//    }
//    
//    
   
    /// 创建控制器
    ///
    /// - Parameters:
    ///   - childController: 控制器
    ///   - title: 名称
    ///   - defaultImageName: 标签栏默认图片
    ///   - selectedImageName: 标签栏选中图片

 /*
    private func addChildViewController(_ childController: UIViewController,_ title: NSString, defaultImageName: NSString, selectedImageName: NSString) {
        
        // 创建导航控制器, 并添加
        let navViewController = UINavigationController(rootViewController: childController)
        self.addChildViewController(navViewController)
        

        childController.tabBarItem.image = UIImage(named: defaultImageName as String)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName as String)
        childController.title = title as String
        
        if title.isEqual(to: "消息") {
//            let segmentedControl = UISegmentedControl.init(items: NSArray.init(objects: "消息","电话") as? [Any])
            
            
            let segmentedControl = UISegmentedControl(items: ["消息", "电话"])
            
            segmentedControl.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
            
            segmentedControl.selectedSegmentIndex = 0   // 默认选中第一个
            
            segmentedControl.setTitle("消息", forSegmentAt: 0)
            segmentedControl.setTitle("电话", forSegmentAt: 1)
            
            childController.navigationItem.titleView = segmentedControl
            
//            childController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "run10"), style: .plain , target: self, action: (#selector(QQMainViewController.openDrawer)))
        }
        
    }
   */
    
    
    
}
