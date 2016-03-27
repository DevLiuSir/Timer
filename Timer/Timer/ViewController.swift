//
//  ViewController.swift
//  Timer
//
//  Created by Liu Chuan on 16/3/27.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timerCount = 0
    var timerRunning = false
    var timer = NSTimer()
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    func Counting() {
        
        timerCount += 1
        
        timerLabel.text = "\(timerCount)"
        
    }
    
    
    @IBAction func startButton(sender: UIButton) {
        
        if timerRunning == false {
            
            //调用NSTimer的类方法scheduledTimerWithTimeInterval:target:selector:userInfo:repeats: 创建并启动一个每1秒钟调用1次Counting:方法的timer，并将返回的实例保存到timer中。
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.Counting), userInfo: nil, repeats: true)
            
            timerRunning = true
        }
        
        
    }

    @IBAction func stopButton(sender: UIButton) {
        
        if timerRunning == true {
            
            // 无效
            timer.invalidate()
            
            timerRunning = false
            
        }
        
    }
    
    @IBAction func restart(sender: UIButton) {
        // 复位
        timerCount = 0
        
        timerLabel.text = "0"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

