//
//  ViewController.swift
//  OneButtonApp
//
//  Created by 吴童 on 2017/2/5.
//  Copyright © 2017年 吴童. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert(){
        // 定义了一个alert窗口
        let alert = UIAlertController(title: "Hello World",
                                      message: "This is my first app",
                                      preferredStyle: .alert)
        
        //定义了一个alert窗口中的按钮
        let action = UIAlertAction(title: "Awesome",
                                   style: .default,
                                   handler: nil)
        
        //将action按钮放入到alert提醒窗中
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}

