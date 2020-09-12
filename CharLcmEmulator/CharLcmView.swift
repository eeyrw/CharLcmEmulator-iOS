//
//  CharLcmView.swift
//  CharLcmEmulator
//
//  Created by Coco Yuan on 2020/9/12.
//  Copyright © 2020年 Coco Yuan. All rights reserved.
//

import UIKit

class CharLcmView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let con = UIGraphicsGetCurrentContext()
        let rect = CGRect(x:0,y:0,width:100,height:100)
        con?.addEllipse(in: rect)
        con?.setFillColor(UIColor.red.cgColor)
        con?.fillPath()
    }
}
