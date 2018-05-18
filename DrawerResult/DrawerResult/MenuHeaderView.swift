//
//  MenuHeaderView.swift
//  DrawerResult
//
//  Created by Liu Chuan on 2017/12/10.
//  Copyright © 2018 LC. All rights reserved.
//

import Foundation
import UIKit


class MenuHeaderView: UIView {
    
    // MARK: - 控件属性
    
    /// 头像
    @IBOutlet weak var headerImgView: UIImageView!
    
    /// 背景
    @IBOutlet weak var grayView: UIView!
    
    /// 用户名
    @IBOutlet weak var userNameLabel: UILabel!
    
    /// 签名
    @IBOutlet weak var signLabel: UILabel!
    
    /// 代码顶部约束
    @IBOutlet weak var codeTopConstraint: NSLayoutConstraint!
    
    
    /// 提供一个通过 Xib 快速创建的类方法
    ///
    /// - Returns: MenuBottomView
    static func LoadingMenuHeaderView() -> MenuHeaderView {
        return Bundle.main.loadNibNamed("MenuHeaderView", owner: nil, options: nil)!.first as! MenuHeaderView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headerImgView.layer.cornerRadius = self.headerImgView.frame.width / 2
        self.headerImgView.clipsToBounds = true
        self.headerImgView.layer.borderColor = UIColor.white.cgColor
        self.headerImgView.layer.borderWidth = 2
        self.grayView.backgroundColor = UIColor(white: 0.05, alpha: 0.05)
        self.codeTopConstraint.constant = UIApplication.shared.statusBarFrame.height + 5
    }
}
