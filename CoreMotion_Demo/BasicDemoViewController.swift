//
//  BasicDemoViewController.swift
//  CoreMotion_Demo
//
//  Created by FelixZhao on 2020/3/5.
//  Copyright © 2020 FelixZhao. All rights reserved.
//

import UIKit
import CoreMotion
class BasicDemoViewController: UIViewController {
    
    @IBOutlet weak var showResult: UITextView!
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //这里只判断陀螺仪
        if !motionManager.isGyroActive && motionManager.isGyroAvailable {
            motionManager.gyroUpdateInterval = 0.5
            motionManager.startGyroUpdates()
            
        }
    }
    
    @IBAction func pushData(_ sender: Any) {
        if !motionManager.isDeviceMotionActive && motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.2
            
//            motionManager.startGyroUpdates(to: <#T##OperationQueue#>, withHandler: <#T##CMGyroHandler##CMGyroHandler##(CMGyroData?, Error?) -> Void#>)
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (motion, error) in
                
                let gravity = motion?.gravity //重力
                let acceleration = motion?.userAcceleration; //加速度
                let rotationRate = motion?.rotationRate //陀螺仪的转速
                
                var text = "---当前重力数据---\n"
                text += "x: \(gravity!.x)\n"
                text += "y: \(gravity!.y)\n"
                text += "z: \(gravity!.z)\n\n"
                
                text += "---当前陀加速度数据---\n"
                text += "x: \(acceleration!.x)\n"
                text += "y: \(acceleration!.y)\n"
                text += "z: \(acceleration!.z)\n\n"
                //let x = String(format: "%.03f", acceleration.x) //保留小数点后三位
                text += "---当前陀螺仪数据---\n"
                text += "x: \(rotationRate!.x)\n"
                text += "y: \(rotationRate!.y)\n"
                text += "z: \(rotationRate!.z)\n"
                
                self.showResult.text = text
            }
        }
        
    }
    @IBAction func pullData(_ sender: Any) {
        
        
        let gyroData = motionManager.gyroData
        let rotationRate = gyroData?.rotationRate
        var text = "---当前陀螺仪数据---\n"
        text += "x: \(rotationRate!.x)\n"
        text += "y: \(rotationRate!.y)\n"
        text += "z: \(rotationRate!.z)\n"
        self.showResult.text = text
        
        
        
        
    }
    
}
