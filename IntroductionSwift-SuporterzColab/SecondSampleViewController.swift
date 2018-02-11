//
//  ExtensionViewController.swift
//  IntroductionSwift-SuporterzColab
//
//  Created by 伊藤和樹 on 2018/02/10.
//  Copyright © 2018年 kazuki.ito. All rights reserved.
//

import UIKit

class SecondSampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var a = CharacterStatus()
        print(a.Description)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

// キャラクターステータスの拡張
extension CharacterStatus {
    // 全て0のステータス
    public static var Zero:CharacterStatus {
        get {
            var status = CharacterStatus()
            status.Hp = 0
            status.Mp = 0
            status.Attack = 0
            status.Defense = 0
            status.Speed = 0
            return status
        }
    }
    
    // ステータス情報の文字列
    public var Description:String {
        var description = ""
        
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            description += label
            description += ":"
            let valueMirror = Mirror(reflecting: value)
            description += "\(valueMirror.subjectType) = "
            description += "\(value)\n"
        }
        return description
    }
    
    // 成長値(倍率)を反映する
    public mutating func ReflectGrowthRate(rate:Float) -> Void {
        var rate = rate
        rate += 1
        self.Hp = Int(Float(self.Hp) * rate)
        self.Mp = Int(Float(self.Mp) * rate)
        self.Attack = Int(Float(self.Attack) * rate)
        self.Defense = Int(Float(self.Defense) * rate)
        self.Speed = Int(Float(self.Speed) * rate)
    }
}
