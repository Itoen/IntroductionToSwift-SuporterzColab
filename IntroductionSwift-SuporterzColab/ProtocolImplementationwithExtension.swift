//
//  ProtocolImplementationwithExtension.swift
//  IntroductionSwift-SuporterzColab
//
//  Created by 伊藤和樹 on 2018/02/03.
//  Copyright © 2018年 kazuki.ito. All rights reserved.
//

import UIKit

class ProtocolImplementationWithExtension : UIViewController {
    
    @IBOutlet var _tableView: UITableView!
    
    fileprivate let _sceneNames = [
        "Optional",
        "Property"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self._tableView.delegate = self
        self._tableView.dataSource = self
        self._tableView.allowsSelection = false
        self._tableView.rowHeight = UITableViewAutomaticDimension
        
        let nib = UINib(nibName: "SceneSelectCell", bundle: nil)
        self._tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

/// ExtensionでのProtocol実装
extension ProtocolImplementationWithExtension : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._sceneNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! SceneSelectCellView
        
        cell.setSceneName(name: self._sceneNames[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
}


