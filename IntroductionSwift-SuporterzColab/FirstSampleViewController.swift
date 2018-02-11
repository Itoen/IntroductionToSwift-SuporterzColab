//
//  PropertyViewController.swift
//  IntroductionSwift-SuporterzColab
//
//  Created by 伊藤和樹 on 2018/02/10.
//  Copyright © 2018年 kazuki.ito. All rights reserved.
//

import UIKit

class FirstSampleViewController: UIViewController {
    
    @IBOutlet weak var _inputField: UITextField!
 
    @IBOutlet weak var _label: UILabel!
    
    private var num:Int = 0{
        // プロパティ監視(didSet)で素数チェック
        didSet(oldValue){
            if(self.IsPrime(num: num)){
                self._label.text = "素数です"
                return
            }
            self._label.text = "素数ではありません"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 素数チェック
    func IsPrime(num: Int) -> Bool {
        if num < 2 {
            return false
        } else if num == 2 {
            return true
        } else if num % 2 == 0 {
            return false
        }
        
        var result = true
        let sqrtNum = sqrt(Double(num))
        stride(from: 3, through: sqrtNum, by: 2).forEach{i in
            if num % Int(i) == 0 {
                result = false
                return
            }
        }
        return result
    }

    // 入力内容変更時処理
    @IBAction func onChageInputField(_ sender: UITextField) {
        if let text = sender.text {
            if let inputNum = Int(text) {
                self.num = inputNum
                return
            }
        }
        self.num = 0
    }
    
    // スクリーンタップ時処理
    @IBAction func onTapScreen(_ sender: Any) {
        self.view.endEditing(true)
    }
}
