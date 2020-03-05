//
//  ViewController.swift
//  CoreMotion_Demo
//
//  Created by FelixZhao on 2020/3/5.
//  Copyright © 2020 FelixZhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  var basicButton:UIButton{
        get {
            let btn = UIButton(frame:CGRect(x: screenWidth/2 - 50, y: screenHeight/2 - 15 - 200, width: 100, height: 30))
            btn.setTitle("基本演示", for:.normal)
            btn.setTitleColor(.black, for: .normal)
            btn.addTarget(self, action: #selector(pushToBasic), for: .touchUpInside)
            return btn
        }
    }
    
 var imageButton:UIButton{
        get {
            let btn = UIButton(frame:CGRect(x: screenWidth/2 - 50, y: screenHeight/2 - 15 , width: 100, height: 30))
            btn.setTitle("旋转演示", for:.normal)
            btn.setTitleColor(.black, for: .normal)
            btn.addTarget(self, action: #selector(pushToImage), for: .touchUpInside)
            return btn
        }
    }
var popButton:UIButton{
        get {
            let btn = UIButton(frame:CGRect(x: screenWidth/2 - 50, y: screenHeight/2 - 15 + 200, width: 100, height: 30))
            btn.setTitle("Pop演示", for:.normal)
            btn.setTitleColor(.black, for: .normal)
            btn.addTarget(self, action: #selector(pushToPop), for: .touchUpInside)
            return btn
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(basicButton)
        view.addSubview(imageButton)
        view.addSubview(popButton)
        // Do any additional setup after loading the view.
    }
    
    @objc func pushToBasic(){
        let basicVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "base")
        navigationController?.pushViewController(basicVC, animated: true)
    }
    
    @objc func pushToImage(){
        self.navigationController?.pushViewController(ImageDemoViewController(), animated: true)
    }
    @objc func pushToPop(){
        self.navigationController?.pushViewController(PopViewController(), animated: true)
    }
}

