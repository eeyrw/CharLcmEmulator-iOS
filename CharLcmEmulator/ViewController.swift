//
//  ViewController.swift
//  CharLcmEmulator
//
//  Created by Coco Yuan on 2020/9/12.
//  Copyright © 2020年 Coco Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mCharLcmView: CharLcmView!
    var timer:DispatchSourceTimer?
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mCharLcmView.clearScreen()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnTd(_ sender: Any) {
        startTimer()
    }
    func startTimer() {
        timer = DispatchSource.makeTimerSource()
        timer?.schedule(deadline: .now(), repeating: .milliseconds(10))
        timer?.setEventHandler {
            DispatchQueue.main.sync {
                self.mCharLcmView.setCursor(x: 0, y: 0)
                self.mCharLcmView.writeStr(String(format: "Count:%d", self.count))
                self.count = self.count+1
            }
        }
        timer?.resume()
    }
    
}

