//
//  ExtensionViewController.swift
//  IntroductionSwift-SuporterzColab
//
//  Created by 伊藤和樹 on 2018/02/10.
//  Copyright © 2018年 kazuki.ito. All rights reserved.
//

import UIKit

class SecondSampleViewController: UIViewController {
    
    @IBOutlet weak var _growthRateInput: UITextField!
    
    @IBOutlet weak var _nameInput: UITextField!
    
    @IBOutlet weak var _hpInput: UITextField!
    
    @IBOutlet weak var _mpInput: UITextField!
    
    @IBOutlet weak var _attackInput: UITextField!
    
    @IBOutlet weak var _defenseInput: UITextField!
    
    @IBOutlet weak var _speedInput: UITextField!
    
    fileprivate var growthRate:Float = 0
    
    // ステータス情報
    var status:CharacterStatus!
    // ステータス表示ラベル
    @IBOutlet weak var _statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.status = CharacterStatus()
        self.status.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChangeName(_ sender: UITextField) {
        if let name = sender.text {
            self.status.Name = name
            return
        }
        self.status.Name = ""
    }
    // ステータス補正値変更時処理
    @IBAction func onChangeReflectRate(_ sender: UITextField) {
        if let rateText = sender.text {
            if let rate = Float(rateText) {
                self.growthRate = rate
                self._statusLabel.text = self.status.ReflectGrowthRate(rate: self.growthRate).Description
                return
            }
        }
        self.growthRate = 0
        self._statusLabel.text = self.status.ReflectGrowthRate(rate: self.growthRate).Description
    }
    
    // HP変更時処理
    @IBAction func onChangeHp(_ sender: UITextField) {
        if let hpText = sender.text {
            if let hp = Int(hpText) {
                self.status.Hp = hp
                return
            }
        }
        self.status.Hp = 0
    }
    
    // MP変更時処理
    @IBAction func onChangeMp(_ sender: UITextField) {
        if let mpText = sender.text {
            if let mp = Int(mpText) {
                self.status.Mp = mp
                return
            }
        }
        self.status.Mp = 0
    }
    
    // 攻撃力変更時処理
    @IBAction func onChangeAttack(_ sender: UITextField) {
        if let attackText = sender.text {
            if let attack = Int(attackText) {
                self.status.Attack = attack
                return
            }
        }
        self.status.Attack = 0
    }
    
    // 防御力変更時処理
    @IBAction func onChangeDefense(_ sender: UITextField) {
        if let defenseText = sender.text {
            if let defense = Int(defenseText) {
                self.status.Defense = defense
                return
            }
        }
        self.status.Defense = 0
    }
    
    // 速さ変更時処理
    @IBAction func onChangeSpeed(_ sender: UITextField) {
        if let speedText = sender.text {
            if let speed = Int(speedText) {
                self.status.Speed = speed
                return
            }
        }
        self.status.Speed = 0
    }
    
    // リセットボタンタップ時処理
    @IBAction func onTapReset(_ sender: UITextField) {
        self.status = CharacterStatus.Zero
        self.growthRate = 0
        self._nameInput.text = ""
        self._growthRateInput.text = ""
        self._hpInput.text = ""
        self._mpInput.text = ""
        self._attackInput.text = ""
        self._defenseInput.text = ""
        self._speedInput.text = ""
        self._statusLabel.text = self.status.Description
        self.status.delegate = self
    }
    
    // スクリーンタップ時処理
    @IBAction func onTapScreen(_ sender: UITapGestureRecognizer) {
        // キーボードを閉じる
        self.view.endEditing(true)
    }
}

extension SecondSampleViewController : CharacterStatusDelegate
{
    func onStatusValueChanged(status: CharacterStatus) {
        if self.growthRate > 0 {
            self._statusLabel.text = status.ReflectGrowthRate(rate: growthRate).Description
            return
        }
        self._statusLabel.text = status.Description
    }
}

// キャラクターステータスの拡張
extension CharacterStatus {
    // 全て0のステータス
    public static var Zero:CharacterStatus {
        get {
            let status = CharacterStatus()
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
            if label == "delegate" {
                continue
            }
            description += label
            description += ":"
            let valueMirror = Mirror(reflecting: value)
            description += "\(valueMirror.subjectType) = "
            description += "\(value)\n"
        }
        return description
    }
    
    // 成長値(倍率)を反映する
    public func ReflectGrowthRate(rate:Float) -> CharacterStatus {
        var rate = rate
        rate += 1
        let  status = CharacterStatus()
        status.Name = self.Name
        status.Hp = Int(Float(self.Hp) * rate)
        status.Mp = Int(Float(self.Mp) * rate)
        status.Attack = Int(Float(self.Attack) * rate)
        status.Defense = Int(Float(self.Defense) * rate)
        status.Speed = Int(Float(self.Speed) * rate)
        return status
    }
}
