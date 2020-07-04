//
//  NSLayoutConstraint+setMultiplier.swift
//  kimuraBom
//
//  Created by Sakurako Shimbori on 2020/06/30.
//  Copyright © 2020 Taisei Hikawa. All rights reserved.
//

import UIKit
//NSLayoutConstraint内にmultiplierを書き換える関数setMultiplierを設定
extension NSLayoutConstraint{
    func setMultiplier(_ multiplier:CGFloat) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}


 
