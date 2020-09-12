//
//  FontGenerator.swift
//  CharLcmEmulator
//
//  Created by Coco Yuan on 2020/9/12.
//  Copyright © 2020年 Coco Yuan. All rights reserved.
//

import Foundation
import UIKit

class FontGenerator {
    
    let mRawFontsData:[UInt8] = [ // 纵向排列的。
        0x00, 0x00, 0x00, 0x00, 0x00,// ' '
        0x00, 0x00, 0x5F, 0x00, 0x00,// !
        0x00, 0x07, 0x00, 0x07, 0x00,// "
        0x14, 0x7F, 0x14, 0x7F, 0x14,// #
        0x24, 0x2A, 0x7F, 0x2A, 0x12,// $
        0x23, 0x13, 0x08, 0x64, 0x62,// %
        0x37, 0x49, 0x55, 0x22, 0x50,// &
        0x00, 0x05, 0x03, 0x00, 0x00,// '
        0x00, 0x1C, 0x22, 0x41, 0x00,// (
        0x00, 0x41, 0x22, 0x1C, 0x00,// )
        0x08, 0x2A, 0x1C, 0x2A, 0x08,// *
        0x08, 0x08, 0x3E, 0x08, 0x08,// +
        0x00, 0x50, 0x30, 0x00, 0x00,// ,
        0x08, 0x08, 0x08, 0x08, 0x08,// -
        0x00, 0x60, 0x60, 0x00, 0x00,// .
        0x20, 0x10, 0x08, 0x04, 0x02,// /
        0x3E, 0x51, 0x49, 0x45, 0x3E,// 0
        0x00, 0x42, 0x7F, 0x40, 0x00,// 1
        0x42, 0x61, 0x51, 0x49, 0x46,// 2
        0x21, 0x41, 0x45, 0x4B, 0x31,// 3
        0x18, 0x14, 0x12, 0x7F, 0x10,// 4
        0x27, 0x45, 0x45, 0x45, 0x39,// 5
        0x3C, 0x4A, 0x49, 0x49, 0x30,// 6
        0x01, 0x71, 0x09, 0x05, 0x03,// 7
        0x36, 0x49, 0x49, 0x49, 0x36,// 8
        0x06, 0x49, 0x49, 0x29, 0x1E,// 9
        0x00, 0x36, 0x36, 0x00, 0x00,// :
        0x00, 0x56, 0x36, 0x00, 0x00,// ;
        0x00, 0x08, 0x14, 0x22, 0x41,// <
        0x14, 0x14, 0x14, 0x14, 0x14,// =
        0x41, 0x22, 0x14, 0x08, 0x00,// >
        0x02, 0x01, 0x51, 0x09, 0x06,// ?
        0x32, 0x49, 0x79, 0x41, 0x3E,// @
        0x7E, 0x11, 0x11, 0x11, 0x7E,// A
        0x7F, 0x49, 0x49, 0x49, 0x36,// B
        0x3E, 0x41, 0x41, 0x41, 0x22,// C
        0x7F, 0x41, 0x41, 0x22, 0x1C,// D
        0x7F, 0x49, 0x49, 0x49, 0x41,// E
        0x7F, 0x09, 0x09, 0x01, 0x01,// F
        0x3E, 0x41, 0x41, 0x51, 0x32,// G
        0x7F, 0x08, 0x08, 0x08, 0x7F,// H
        0x00, 0x41, 0x7F, 0x41, 0x00,// I
        0x20, 0x40, 0x41, 0x3F, 0x01,// J
        0x7F, 0x08, 0x14, 0x22, 0x41,// K
        0x7F, 0x40, 0x40, 0x40, 0x40,// L
        0x7F, 0x02, 0x04, 0x02, 0x7F,// M
        0x7F, 0x04, 0x08, 0x10, 0x7F,// N
        0x3E, 0x41, 0x41, 0x41, 0x3E,// O
        0x7F, 0x09, 0x09, 0x09, 0x06,// P
        0x3E, 0x41, 0x51, 0x21, 0x5E,// Q
        0x7F, 0x09, 0x19, 0x29, 0x46,// R
        0x46, 0x49, 0x49, 0x49, 0x31,// S
        0x01, 0x01, 0x7F, 0x01, 0x01,// T
        0x3F, 0x40, 0x40, 0x40, 0x3F,// U
        0x1F, 0x20, 0x40, 0x20, 0x1F,// V
        0x7F, 0x20, 0x18, 0x20, 0x7F,// W
        0x63, 0x14, 0x08, 0x14, 0x63,// X
        0x03, 0x04, 0x78, 0x04, 0x03,// Y
        0x61, 0x51, 0x49, 0x45, 0x43,// Z
        0x00, 0x00, 0x7F, 0x41, 0x41,// [
        0x02, 0x04, 0x08, 0x10, 0x20,// "\"
        0x41, 0x41, 0x7F, 0x00, 0x00,// ]
        0x04, 0x02, 0x01, 0x02, 0x04,// ^
        0x40, 0x40, 0x40, 0x40, 0x40,// _
        0x00, 0x01, 0x02, 0x04, 0x00,// `
        0x20, 0x54, 0x54, 0x54, 0x78,// a
        0x7F, 0x48, 0x44, 0x44, 0x38,// b
        0x38, 0x44, 0x44, 0x44, 0x20,// c
        0x38, 0x44, 0x44, 0x48, 0x7F,// d
        0x38, 0x54, 0x54, 0x54, 0x18,// e
        0x08, 0x7E, 0x09, 0x01, 0x02,// f
        0x08, 0x14, 0x54, 0x54, 0x3C,// g
        0x7F, 0x08, 0x04, 0x04, 0x78,// h
        0x00, 0x44, 0x7D, 0x40, 0x00,// i
        0x20, 0x40, 0x44, 0x3D, 0x00,// j
        0x00, 0x7F, 0x10, 0x28, 0x44,// k
        0x00, 0x41, 0x7F, 0x40, 0x00,// l
        0x7C, 0x04, 0x18, 0x04, 0x78,// m
        0x7C, 0x08, 0x04, 0x04, 0x78,// n
        0x38, 0x44, 0x44, 0x44, 0x38,// o
        0x7C, 0x14, 0x14, 0x14, 0x08,// p
        0x08, 0x14, 0x14, 0x18, 0x7C,// q
        0x7C, 0x08, 0x04, 0x04, 0x08,// r
        0x48, 0x54, 0x54, 0x54, 0x20,// s
        0x04, 0x3F, 0x44, 0x40, 0x20,// t
        0x3C, 0x40, 0x40, 0x20, 0x7C,// u
        0x1C, 0x20, 0x40, 0x20, 0x1C,// v
        0x3C, 0x40, 0x30, 0x40, 0x3C,// w
        0x44, 0x28, 0x10, 0x28, 0x44,// x
        0x0C, 0x50, 0x50, 0x50, 0x3C,// y
        0x44, 0x64, 0x54, 0x4C, 0x44,// z
        0x00, 0x08, 0x36, 0x41, 0x00,// {
        0x00, 0x00, 0x7F, 0x00, 0x00,// |
        0x00, 0x41, 0x36, 0x08, 0x00,// }
        0x02, 0x01, 0x02, 0x04, 0x02,// ~
        0xff, 0xff, 0xff, 0xff, 0xff // black
        // block
    ]
    var mUnitWidth:Double
    var mUnitHeight:Double
    
    var mCharWidthOffset:Double = 1
    var mCharHeightOffset:Double = 1
    
    var mFontBitmapMain = [CGImage]()
    var mFontBitmapCustom = [CGImage]()
    
    var mCustomFontRawData:[UInt8]
    
    let mPixelSpaceWeight:Double = 1
    let mPixelWeight:Double = 5
    let mCharSpaceWeight:Double = 5
    let mMarginWeight:Double = 12
    
    let mPixelsPerRow:Int = 5
    let mPixelsPerCol :Int = 8
    
    let mBytesPerFont:Int = 5
    
    var mColRowSize:CGPoint
    
    var mPositivePixelColor:CGColor = UIColor.white.cgColor
    var mNegativePixelColor:CGColor = UIColor.red.cgColor
    var mLcdPanelColor:CGColor = UIColor.black.cgColor
    
    var mUIScale:Double
    
    init(colRowSize:CGPoint, areaSize:CGPoint,customFontRawData:[UInt8]) {
        
        mColRowSize = colRowSize
        let colNum:Double = Double(mColRowSize.x)
        let rowNum:Double = Double(mColRowSize.y)
        
        mUIScale = Double(UIScreen.main.scale)
        
        let surfaceWidth:Double = Double(areaSize.x)*mUIScale
        let surfaceHeight:Double = Double(areaSize.y)*mUIScale
        // mMarginWeight*2+colNum*(mPixelWeight*mPixelsPerRow+mPixelSpaceWeight*(mPixelsPerRow-1))+(colNum-1)*mCharSpaceWeight
        mUnitWidth = surfaceWidth / (mMarginWeight * 2 + colNum * (mPixelWeight * Double(mPixelsPerRow) + mPixelSpaceWeight * Double(mPixelsPerRow - 1)) + (colNum - 1) * mCharSpaceWeight)
        // mMarginWeight*2+rowNum*(mPixelWeight*mPixelsPerCol+mPixelSpaceWeight*(mPixelsPerCol-1))+(rowNum-1)*2*mCharSpaceWeight
        mUnitHeight = surfaceHeight / (mMarginWeight * 2 + rowNum * (mPixelWeight * Double(mPixelsPerCol) + mPixelSpaceWeight * Double(mPixelsPerCol - 1)) + (rowNum - 1) * 2 * mCharSpaceWeight)
        
        mCustomFontRawData = customFontRawData;
        
        genMainFontBitmap(unitWidth:mUnitWidth, unitHeight:mUnitHeight);
        genCustomFontBitmap(allRawData:mCustomFontRawData, unitWidth:mUnitWidth, unitHeight:mUnitHeight);
        
        mCharWidthOffset = mUnitWidth * (mPixelWeight * Double(mPixelsPerRow) + Double(mPixelSpaceWeight) * Double((mPixelsPerRow - 1)) + mCharSpaceWeight);
        mCharHeightOffset = mUnitHeight
            * (mPixelWeight * Double(mPixelsPerCol) + mPixelSpaceWeight
                * Double(mPixelsPerCol - 1) + mCharSpaceWeight * 2);
    }
    func convertCGImageToCIImage(cgImage:CGImage) -> CIImage{
        return CIImage.init(cgImage: cgImage)
    }

    
    func convertUIImageToCGImage(_ uiImage:UIImage) -> CGImage {
        var cgImage = uiImage.cgImage
        
        if cgImage == nil {
            let ciImage = uiImage.ciImage
            cgImage = self.convertCIImageToCGImage(ciImage: ciImage!)
        }
        return cgImage!
    }
   
    
    func convertCIImageToCGImage(ciImage:CIImage) -> CGImage{
        
        
        let ciContext = CIContext.init()
        let cgImage:CGImage = ciContext.createCGImage(ciImage, from: ciImage.extent)!
        return cgImage
    }
    
    func genSingleCustomFontBitmap(raw:[UInt8],unitWidth:Double,unitHeight:Double) -> CGImage {
        
        let bitmapWidth = Int(unitWidth * (mPixelWeight * Double(mPixelsPerRow) + mPixelSpaceWeight * Double(mPixelsPerRow - 1)))
        let bitmapHeight = Int(unitHeight * (mPixelWeight * Double(mPixelsPerCol) + mPixelSpaceWeight * Double(mPixelsPerCol - 1)))
        
        UIGraphicsBeginImageContext(CGSize(width: bitmapWidth, height: bitmapHeight))
        let con = UIGraphicsGetCurrentContext()
        
        let charPixelWidth = mUnitWidth * mPixelWeight;
        let charPixelHeight = mUnitHeight * mPixelWeight;
        con?.setFillColor(mLcdPanelColor)
        con?.fill(CGRect(x: 0, y: 0, width: bitmapWidth, height: bitmapHeight))
        
        for y in 0..<mPixelsPerCol {
            for x in 0..<mPixelsPerRow {
                
                let pixelRectLeft = (Double(x) * (charPixelWidth + mPixelSpaceWeight * mUnitWidth))
                let pixelRectTop = (Double(y) * (charPixelHeight + mPixelSpaceWeight * mUnitHeight))
                
                let pixelRect = CGRect(x: pixelRectLeft, y: pixelRectTop, width: charPixelWidth, height: charPixelHeight)

                if ((raw[y] & (1 << x)) != 0)
                {
                    con?.setFillColor(mPositivePixelColor)
                }
                else
                {
                    con?.setFillColor(mNegativePixelColor)
                }
                con?.fill(pixelRect)
            }
        }
        
        let fontBitmap = convertUIImageToCGImage(UIGraphicsGetImageFromCurrentImageContext()!)
        UIGraphicsEndImageContext()
        return fontBitmap;
        
    }
    
    func genSingleFontBitmap(fontIndex:Int, unitWidth:Double,
                             unitHeight:Double)->CGImage {
        let bitmapWidth = Int(unitWidth * (mPixelWeight * Double(mPixelsPerRow) + mPixelSpaceWeight * Double(mPixelsPerRow - 1)))
        let bitmapHeight = Int(unitHeight * (mPixelWeight * Double(mPixelsPerCol) + mPixelSpaceWeight * Double(mPixelsPerCol - 1)))
        
        UIGraphicsBeginImageContext(CGSize(width: bitmapWidth, height: bitmapHeight))
        let con = UIGraphicsGetCurrentContext()
        
        con?.translateBy(x: 0, y: CGFloat(bitmapHeight))
        con?.scaleBy(x: 1, y: -1)
        
        let charPixelWidth = mUnitWidth * mPixelWeight;
        let charPixelHeight = mUnitHeight * mPixelWeight;
        con?.setFillColor(mLcdPanelColor)
        con?.fill(CGRect(x: 0, y: 0, width: bitmapWidth, height: bitmapHeight))
        
        for y in 0..<mPixelsPerCol {
            for x in 0..<mPixelsPerRow {
                
                let pixelRectLeft = (Double(x) * (charPixelWidth + mPixelSpaceWeight * mUnitWidth))
                let pixelRectTop = (Double(y) * (charPixelHeight + mPixelSpaceWeight * mUnitHeight))
                
                let pixelRect = CGRect(x: pixelRectLeft, y: pixelRectTop, width: charPixelWidth, height: charPixelHeight)
                
                if ((mRawFontsData[Int(fontIndex * mPixelsPerRow + x)] & (1 << y)) != 0)
                {
                    con?.setFillColor(mPositivePixelColor)
                }
                else
                {
                    con?.setFillColor(mNegativePixelColor)
                }
                con?.fill(pixelRect)
            }
        }
        
        let fontBitmap = convertUIImageToCGImage(UIGraphicsGetImageFromCurrentImageContext()!)
        UIGraphicsEndImageContext()
        return fontBitmap;
        
    }
    
    func genMainFontBitmap(unitWidth:Double, unitHeight:Double) {
        
        let fontNum = mRawFontsData.count / mBytesPerFont as Int
        for fontIndex in 0..<fontNum {
            mFontBitmapMain.append(genSingleFontBitmap(fontIndex: fontIndex,
                                                             unitWidth: unitWidth, unitHeight: unitHeight))
        }
        print("Custom font generated.\n")
    }
    
    func genCustomFontBitmap(allRawData:[UInt8],unitWidth:Double,unitHeight:Double) {
        
        let fontNum = 8;
        
        var mFontBitmapCustom = [CGImage]()
        var temp = [UInt8](repeating: 0, count: fontNum)

        
        for fontIndex in 0..<fontNum{
            
            temp[0..<temp.count]=allRawData[fontIndex*8..<fontIndex*8+temp.count]
            mFontBitmapCustom.append(genSingleCustomFontBitmap(raw: temp,
                                                                     unitWidth: unitWidth, unitHeight: unitHeight))
        }
        print("Main font generated.\n")
    }
    
    func setColRowSize(size: CGPoint) {
        mColRowSize = size;
    }
    
    func getColRowSize()->CGPoint {
        return mColRowSize;
    }
    
    func getActualCursor(cursor:CGPoint)->CGPoint{
        let actualCursor = CGPoint(
            x: Double(mMarginWeight * mUnitWidth + mCharWidthOffset * Double(cursor.x))/mUIScale,
            y: Double(mMarginWeight * mUnitHeight + mCharHeightOffset * Double(cursor.y))/mUIScale
        )
        return actualCursor
    }
    
    func getActualCursorWithXY(x:Int,y:Int)->CGPoint{
        return getActualCursor(cursor: CGPoint(x: x, y: y))
    }
    
    func getCharBitmap(char:CChar)->CGImage {
        
        var charNum = Int(char)
        // ' ' in ASCII is 32
        if (charNum >= 32 && charNum <= 127) {
            charNum -= 32;
        } else if (charNum >= 0 && charNum <= 7) {
            return mFontBitmapCustom[charNum];
        } else {
            charNum = 32;
        }
        
        return mFontBitmapMain[charNum];
        
    }
    
}
