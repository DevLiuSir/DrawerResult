//
//  SubViewController.swift
//  DrawerResult
//
//  Created by Liu Chuan on 2017/12/10.
//  Copyright © 2018 LC. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "子控制器"
        
        let emptyImgView = UIImageView(image: UIImage(named: "img_empty_photo"))
        emptyImgView.center = self.view.center
        self.view.addSubview(emptyImgView)
        
    }
}
