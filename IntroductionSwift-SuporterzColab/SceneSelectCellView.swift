//
//  SceneSelectCell.swift
//  IntroductionSwift-SuporterzColab
//
//  Created by 伊藤和樹 on 2018/02/04.
//  Copyright © 2018年 kazuki.ito. All rights reserved.
//

import UIKit

class  SceneSelectCellView: UITableViewCell {
    
    @IBOutlet weak var _sceneName: UILabel!
    
    override func awakeFromNib() {
        self._sceneName.text = nil
    }
    //! @brief シーン名設定
    //! @param name シーン名
    public func setSceneName(name:String){
        self._sceneName.text = name
    }
}
