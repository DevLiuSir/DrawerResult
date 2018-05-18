//
//  MenuBottomView.swift
//  DrawerResult
//
//  Created by Liu Chuan on 2017/12/10.
//  Copyright © 2018 LC. All rights reserved.
//

import Foundation
import UIKit

class MenuBottomView: UIView {
    
    /// 温度标签
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    /// 提供一个通过 Xib 快速创建的类方法
    ///
    /// - Returns: MenuBottomView
    static func LoadingMenuBottomView() -> MenuBottomView {
        return Bundle.main.loadNibNamed("MenuBottomView", owner: nil, options: nil)!.first as! MenuBottomView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

