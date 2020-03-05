//
//  PopViewController.swift
//  CoreMotion_Demo
//
//  Created by FelixZhao on 2020/3/5.
//  Copyright © 2020 FelixZhao. All rights reserved.
//

import UIKit
import CoreMotion
class PopViewController: UIViewController {
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        getDeviceMotion()
    }
    
    func getDeviceMotion() {
        if motionManager.isDeviceMotionAvailable && !motionManager.isDeviceMotionActive {
            motionManager.deviceMotionUpdateInterval = 0.1
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                if (data?.userAcceleration.x)! < -0.5 {
                    print(data?.userAcceleration.x)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    
    
}
