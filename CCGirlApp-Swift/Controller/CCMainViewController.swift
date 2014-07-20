//
//  CCMainViewController.swift
//  CCFunnyClient-Swift
//
//  Created by CocoaChen on 14-7-19.
//  Copyright (c) 2014 CocoaChen. All rights reserved.
//

import UIKit

class CCMainViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {

    let cellIndentifier = "girlCell"
    var girlTableView : UITableView?
    var girlDataList = NSMutableArray()
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Girl"
        self.automaticallyAdjustsScrollViewInsets = false
        
        setupTableView()
        fetchGirlsImageListData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTableView() {
        girlTableView = UITableView(frame: CGRectMake(0, 64, CGRectGetWidth(self.view!.frame), CGRectGetHeight(self.view!.frame) - 64), style: UITableViewStyle.Plain)
        girlTableView!.backgroundColor = UIColor.clearColor()
        girlTableView!.delegate = self
        girlTableView!.dataSource = self
        girlTableView!.separatorStyle = UITableViewCellSeparatorStyle.None
        girlTableView!.registerClass(CCGirlCell.self, forCellReuseIdentifier: cellIndentifier)
        self.view.addSubview(girlTableView)
    }

    func fetchGirlsImageListData() {
        CCHttpRequest.requestWithURLString("http://42.121.111.22/weibofun/weibo_list.php?category=weibo_girls", completionHandler: { data in
            if data as NSObject == NSNull() {
                println("Loading Failed")
                return
            }
//            println("data:\(data)")
            var arr = data["items"] as NSArray
            for dict : AnyObject in arr {
                var girl = CCGirl(attributes: dict as NSDictionary)
                self.girlDataList.addObject(girl)
            }
            self.girlTableView!.reloadData()
        })
    }
//    #pragma mark - TableView Delegate And DataSource
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return girlDataList.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView!.dequeueReusableCellWithIdentifier(cellIndentifier) as? CCGirlCell
        cell!.selectionStyle = UITableViewCellSelectionStyle.None
        var girl = girlDataList[indexPath!.row] as CCGirl
        cell!.setupCell(girl)
        return cell
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        var girl = girlDataList[indexPath!.row] as CCGirl
        return CCGirlCell.heightForCell(girl)
    }
}
