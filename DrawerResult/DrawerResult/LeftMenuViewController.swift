//
//  LeftMenuViewController.swift
//  DrawerResult
//
//  Created by Liu Chuan on 2017/3/26.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit

let screenW: CGFloat = UIScreen.main.bounds.width
let screenH: CGFloat = UIScreen.main.bounds.height

private let headerViewH: CGFloat = 200      // 头部视图高度
private let colorLan = UIColor(colorLiteralRed: 13.0 / 255.0, green: 184.0 / 255.0, blue: 246.0 / 255.0, alpha: 1.0)


private let cellID = "CELLID"       // 重用标识符

class LeftMenuViewController: UIViewController {

    
    // MARK: - 属性
    /// 定义一个数组,存储表格视图的数据\Icon
    var dataArray: [Array<String>] {
        let array = [["我的超级会员", "vip_shadow"],["QQ钱包", "sidebar_purse"],["个性装扮", "sidebar_decoration"],["我的收藏", "sidebar_favorit"], ["我的相册", "sidebar_album"],["我的文件", "sidebar_file"]]
        return array
    }
    // MARK: - 懒加载
    /// 表格视图的上面的头部视图
    private lazy var headerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: headerViewH))
//        view.backgroundColor = UIColor(patternImage: UIImage(named: "sidebar_bg")!)
        
        let bgImageView = UIImageView(frame: view.frame)
        bgImageView.image = UIImage(named: "sidebar_bg")
        bgImageView.contentMode = UIViewContentMode.scaleAspectFill
        bgImageView.clipsToBounds = true
        view.addSubview(bgImageView)
        return view
    }()
    
    /// 表格视图
    private lazy var tableView : UITableView = {
       
        // 创建表格视图, 并设置其相关属性
        let table = UITableView(frame: CGRect(x: 0, y: 200, width: screenW, height: screenH - 200), style: .plain)
        table.separatorStyle = .none                // 设置指示器样式
        table.backgroundColor = UIColor.white
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
        view.addSubview(headerView)
        view.addSubview(tableView)
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
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
