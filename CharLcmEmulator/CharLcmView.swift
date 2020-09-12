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
        let fg = FontGenerator(colRowSize: CGPoint(x:20,y:4), areaSize: CGPoint(x:rect.width,y:rect.height), customFontRawData: [UInt8](repeating: 0, count: 100))
        
        var charS:CChar = "A".cString(using: String.Encoding.ascii)![0]
        for cY in 0..<4
        {
            for cX in 0..<20
            {

                let bp = fg.getCharBitmap(char:charS)
                let cr = fg.getActualCursorWithXY(x: cX, y: cY)
                let charRect = CGRect(x: cr.x, y: cr.y, width: CGFloat(bp.width)/UIScreen.main.scale, height: CGFloat(bp.height)/UIScreen.main.scale)
                con?.draw(bp, in: charRect)
                
                NSLog("CX:%f,CY:%f,W:%f,H:%f\n",cr.x,cr.y,Float(bp.width),Float(bp.height))
                if(charS<126)
                {
                    charS = charS+1
                    
                }
            }
        }
        
    }
}
