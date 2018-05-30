//
//  ViewController.swift
//  girlTime
//
//  Created by user on 2018/5/30.
//  Copyright © 2018年 user. All rights reserved.
//

import UIKit

var timer: Timer?
var oldTime = "00"
let images = ["1","2","3","4","5"]
var i = 0

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            let now = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss\nyyyy/MMM/dd E"
            let time = formatter.string(from: now)
            self.timeLabel.text = time
            
            formatter.dateFormat = "mm"
            let newTime = formatter.string(from: now)
            if newTime > oldTime || (newTime == "00" && oldTime != "00"){
                self.imageView.image = UIImage(named: images[i])
                oldTime = newTime
                i = i + 1
                if i >= 5 {
                    i = 0
                }
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidDisappear(_ animated: Bool) {
        if timer != nil {
            timer?.invalidate()
        }
    }

}

