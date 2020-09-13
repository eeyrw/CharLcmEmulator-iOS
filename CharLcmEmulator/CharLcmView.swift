//
//  CharLcmView.swift
//  CharLcmEmulator
//
//  Created by Coco Yuan on 2020/9/12.
//  Copyright © 2020年 Coco Yuan. All rights reserved.
//

import UIKit

class CharLcmView: UIView {
    var mFontGen:FontGenerator?
    var mPositivePixelColor:CGColor
    {
        set{
            
        }
        get{
            return UIColor.white.cgColor
        }
    }
    var mNegativePixelColor:CGColor = UIColor.red.cgColor
    var mLcdPanelColor:CGColor = UIColor.black.cgColor
    // SurfaceView
    var mSurfaceHeight:Int?
    var mSurfaceWidth:Int?
    
    // Virtual LCM property
    var mColNum:Int = 20
    var mRowNum:Int = 4
    
    var mCursorX:Int = 0
    var mCursorY:Int = 0
    
    var mLcmChars:[CChar]?
    var mCustomCharsRaw:[UInt8]?

    
    override init(frame: CGRect) {
        print("    override init(frame: CGRect)")
        super.init(frame: frame)
        setupView()
        
    }
    
    //initWithCode to init view from xib or storyboard
    required public init?(coder aDecoder: NSCoder) {
        print("required init?(coder aDecoder: NSCoder) ")
        super.init(coder: aDecoder)
        setupView()
    }
    //common func to init our view
    private func setupView() {
        mSurfaceHeight = Int(frame.height)
        mSurfaceWidth = Int(frame.width)
        mLcmChars = [CChar](repeating: " ".cString(using: String.Encoding.ascii)![0], count: mColNum*mRowNum)
        mCustomCharsRaw = [UInt8](repeating: 0x0F, count: 64)
        mFontGen = FontGenerator(colRowSize: CGPoint(x:mColNum,y:mRowNum), areaSize: CGPoint(x:mSurfaceWidth!,y:mSurfaceHeight!), customFontRawData: mCustomCharsRaw!)
        writeStr("Character Lcm Emulator on iOS!")
    }

    func forceReDraw()
    {
        setNeedsDisplay()
    }
    func writeStr(_ str:String) {
        let chars = str.cString(using: String.Encoding.ascii)!
        mLcmChars![mCursorX + mCursorY * mColNum..<mCursorX + mCursorY * mColNum+chars.count-1] = chars[0..<chars.count-1] //Skip end zero of c string
        mCursorX += (mCursorX + mCursorY * mColNum + chars.count) % mColNum;
        forceReDraw();
    }
    
    func setCustomFont(_ index:Int, _ rawdata:[UInt8]) {
        
        mCustomCharsRaw![index*8..<index*8+rawdata.count]=rawdata[0..<rawdata.count]
        reGenResoures();
        forceReDraw();
    }
    
    func clearScreen() {
        
        for i in 0..<mRowNum * mColNum {
            mLcmChars![i] = " ".cString(using: String.Encoding.ascii)![0] // 空格字符
        }
        mCursorX = 0;
        mCursorY = 0;
        forceReDraw();
    }
    
    func setCursor(x:Int,y:Int) {
        mCursorX = x;
        mCursorY = y;
    }
    
    func reGenResoures() {
        mFontGen = FontGenerator(colRowSize: CGPoint(x:mColNum,y:mRowNum), areaSize: CGPoint(x:mSurfaceWidth!,y:mSurfaceHeight!), customFontRawData: mCustomCharsRaw!)
    }
    
    func setColRow(col:Int,row:Int) {
        mColNum = col;
        mRowNum = row;
        reGenResoures();
        forceReDraw();
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override open func draw(_ rect: CGRect) {
        let con = UIGraphicsGetCurrentContext()
        con?.setFillColor(mLcdPanelColor)
        con?.fill(rect)
        
        var dy = 0;

            for y in 0..<mRowNum {
                for x in 0..<mColNum {
                    
                    let bp = mFontGen!.getCharBitmap(char:mLcmChars![dy + x])
                    let cr = mFontGen!.getActualCursorWithXY(x: x, y: y)
                    let charRect = CGRect(x: cr.x, y: cr.y, width: CGFloat(bp.width)/UIScreen.main.scale, height: CGFloat(bp.height)/UIScreen.main.scale)
                    con?.draw(bp, in: charRect)
                }
                dy += mColNum
        }
        
    }
}
