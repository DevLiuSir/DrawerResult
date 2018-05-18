//
//  MessageViewController.swift
//  DrawerResult
//
//  Created by Liu Chuan on 2017/3/26.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()

    }
    
    //导航栏左侧按钮事件响应
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        print(#function)
        
        DrawerViewController.shareDrawer?.openLeftMenu(openDrawerWithDuration: 0.25)
        
    }

    //MARK: - 更多功能
    @IBAction func showAlert(_ sender: UIBarButtonItem) {
        
        let popVC = PopViewController()
        popVC.modalPresentationStyle = UIModalPresentationStyle.popover
        popVC.popoverPresentationController?.barButtonItem = sender
        popVC.popoverPresentationController?.delegate = self
        popVC.popoverPresentationController?.backgroundColor = UIColor.white
        present(popVC, animated: true, completion: nil)
        
    }
    
}


// MARK: - 配置UI
extension MessageViewController {
    
    private func configUI() {
//        navigationController?.navigationBar.tintColor = .white
    }
}


extension MessageViewController: UIPopoverPresentationControllerDelegate {
    // 模态动画的样式
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
}
