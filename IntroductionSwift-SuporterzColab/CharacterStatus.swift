//
//  CharacterStatus.swift
//  IntroductionSwift-SuporterzColab
//
//  Created by 伊藤和樹 on 2018/02/11.
//  Copyright © 2018年 kazuki.ito. All rights reserved.
//

public class CharacterStatus
{
    var delegate:CharacterStatusDelegate?
    
    public var Name:String = "" {
        didSet(newValue) {
            self.delegate?.onStatusValueChanged(status: self)
        }
    }
    public var Hp:Int = 0 {
        didSet(newValue) {
            self.delegate?.onStatusValueChanged(status: self)
        }
    }
    public var Mp:Int = 0 {
        didSet(newValue) {
            self.delegate?.onStatusValueChanged(status: self)
        }
    }
    public var Attack:Int = 0 {
        didSet(newValue) {
            self.delegate?.onStatusValueChanged(status: self)
        }
    }
    public var Defense:Int = 0 {
        didSet(newValue) {
            self.delegate?.onStatusValueChanged(status: self)
        }
    }
    public var Speed:Int = 0 {
        didSet(newValue) {
            self.delegate?.onStatusValueChanged(status: self)
        }
    }
    
    init() {
    }
}

protocol CharacterStatusDelegate {
    func  onStatusValueChanged(status:CharacterStatus)
}
