//
//  ViewController.swift
//  MicroButtonDemo
//
//  Created by xk on 2020/8/29.
//  Copyright © 2020 xk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bt = MicroButton(microButtonWithFrame: CGRect(x: self.view.frame.width/2.0-94, y: 100, width: 188, height: 188)) { (startRecord) in
            if startRecord {
                print("<<<<<<<<<<<<<  开始录音  >>>>>>>>>>>>")
            }else {
                print("<<<<<<<<<<<<< 结束录音 >>>>>>>>>>>>")
            }
        }
        self.view.backgroundColor = .gray
        self.view.addSubview(bt!)
        
    }


}

