//
//  ViewController.swift
//  Timer
//
//  Created by Liu Chuan on 16/3/27.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /// 标签
    @IBOutlet weak var timerLabel: UILabel!
    
    /// 次数
    private var timerCount = 0
    
    /// 是否运行
    private var timerRunning = false
    
    /// Timer对象
    private var timer = Timer()
    
    
    // MARK: - all actions
    
    // ====================
    // MARK: SATRT_BUTTON
    // ====================
    @IBAction func startButton(_ sender: UIButton) {
        if timerRunning == false {
             /* 创建Timer并启动一个每1秒钟调用1次Counting:方法的timer. 并将返回的实例保存到timer中 */
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Counting), userInfo: nil, repeats: true)
            timerRunning = true
        }
    }

    // ====================
    // MARK: STOP_BUTTON
    // ====================
    @IBAction func stopButton(_ sender: UIButton) {
        
        if timerRunning == true {
            // 无效
            timer.invalidate()
            timerRunning = false
        }
    }
    
    // ====================
    // MARK: RESTART_BUTTON
    // ====================
    @IBAction func restart(_ sender: UIButton) {
        // 复位
        timerCount = 0
        timerLabel.text = "0"
    }
    
    // MARK: - system method
    override func viewDidLoad() {
        
        configLabel()
    }
}

// MARK: - custom method
extension ViewController {
    
    
    /// 配置label
    private func configLabel() {
        timerLabel.layer.borderWidth = 3
        timerLabel.layer.borderColor = #colorLiteral(red: 0.2614974976, green: 0.7886132598, blue: 0.5666816235, alpha: 1)
        timerLabel.layer.cornerRadius = timerLabel.bounds.height / 2
        timerLabel.layer.masksToBounds = true
    }
    
    /// 计数
    @objc private func Counting() {
        timerCount += 1
        timerLabel.text = "\(timerCount)"
        print("-----\(timerCount)")
    }
}

