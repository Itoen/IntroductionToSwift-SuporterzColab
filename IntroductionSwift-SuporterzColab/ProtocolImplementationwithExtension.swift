//
//  ProtocolImplementationwithExtension.swift
//  IntroductionSwift-SuporterzColab
//
//  Created by 伊藤和樹 on 2018/02/03.
//  Copyright © 2018年 kazuki.ito. All rights reserved.
//

import UIKit

/// シーン選択画面のView(テーブルビューのProtocolをExtensionで実装)
class ProtocolImplementationWithExtension : UIViewController {
    

    @IBOutlet var _tableView: UITableView!
    
    /// シーン名
    fileprivate let _sceneNames = [
        "Sample 1",
        "Sample 2",
    ]
    
    /// シーンID
    fileprivate let _sceneID = [
    "FirstSmaple",
    "SecondSample",
    ]
    
    /// 画面読み込み完了時に行う初期化処理
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self._tableView.delegate = self
        self._tableView.dataSource = self
        self._tableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: "SceneSelectCell", bundle: nil)
        self._tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

/// ExtensionでのProtocol実装(テーブルビューのDataSourceとDelegateを実装)
extension ProtocolImplementationWithExtension : UITableViewDataSource, UITableViewDelegate {
    
    /// 表示項目数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._sceneNames.count
    }
    
    /// 表示するセルの情報
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! SceneSelectCellView
        
        cell.setSceneName(name: self._sceneNames[indexPath.row])
        
        return cell
    }
    
    /// セルの表示サイズ
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    /// セルタップの動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let scene = self.storyboard?.instantiateViewController(withIdentifier: self._sceneID[indexPath.row])
        self.navigationController?.pushViewController(scene!, animated: true)

    }
}


