//
//  LeftMenuViewController.swift
//  DrawerResult
//
//  Created by Liu Chuan on 2017/3/26.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

/// 屏幕的宽度
let screenW: CGFloat = UIScreen.main.bounds.width
/// 屏幕的高度
let screenH: CGFloat = UIScreen.main.bounds.height
/// 底部的高度
let bottomViewHeight: CGFloat = 88
/// 左边菜单栏的宽度
let menuWidth = screenW * 0.82
/// 头部视图高度
private let headerViewH: CGFloat = 224
/// 背景色
private let kBackgroundColor = UIColor(white: 0.98, alpha: 0.98)
/// 单元格重用标识符
private let cellID = "CELLID"



class LeftMenuViewController: UIViewController {

    // MARK: - 懒加载 属性
    
    /// 定义一个数组,存储表格视图的数据\Icon
    private lazy var dataArray: [Array<String>] = {
        let array = [["我的超级会员", "vip_shadow"],["QQ钱包", "sidebar_purse"],["个性装扮", "sidebar_decoration"],["我的收藏", "sidebar_favorit"], ["我的相册", "sidebar_album"],["我的文件", "sidebar_file"], ["免流量特权", "sidebar_freetraffic"]]
        return array
    }()
    
    /// 表格视图的上面的头部视图
    private lazy var menuHeaderView: MenuHeaderView = {
        let header = MenuHeaderView.LoadingMenuHeaderView()
        header.frame = CGRect(x: 0, y: 0, width: menuWidth, height: headerViewH)
        return header
    }()
    
    /// 底部视图
    private lazy var menuBottomView: MenuBottomView = {
        let view = MenuBottomView.LoadingMenuBottomView()
        view.frame = CGRect(x: 0, y: screenH - bottomViewHeight - 34, width: menuWidth, height: bottomViewHeight)
        view.backgroundColor = kBackgroundColor
        return view
    }()
    
    /// 表格视图
    private lazy var tableView : UITableView = {
        // 创建表格视图, 并设置其相关属性
        let table = UITableView(frame: CGRect(x: 0, y: headerViewH, width: screenW, height: screenH - headerViewH), style: .plain)
        table.separatorStyle = .none                // 设置指示器样式
        table.backgroundColor = kBackgroundColor
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        return table
    }()
    
    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
    
    /// 配置UI界面
    private func configUI() {
        view.addSubview(tableView)
        view.addSubview(menuHeaderView)
        view.addSubview(menuBottomView)
    }
}


// MARK: - 遵守 UITableViewDataSource 协议
extension LeftMenuViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { 
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row][0]
        cell.imageView?.image = UIImage(named: dataArray[indexPath.row][1])
        cell.backgroundColor = UIColor.clear
        //cell.textLabel?.textColor = UIColor.white
        return cell
    }
}


// MARK: - 遵守 UITableViewDelegate 协议
extension LeftMenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 点击cell闪烁
        tableView.deselectRow(at: indexPath, animated: false)
        print(dataArray[indexPath.row])
        
        
        
        let navigationControl: UINavigationController = UINavigationController()
//        navigationControl?.pushViewController(SubViewController(), animated: true)
        
        navigationControl.pushViewController(SubViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
