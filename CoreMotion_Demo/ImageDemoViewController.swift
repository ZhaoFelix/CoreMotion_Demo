//
//  ImageDemoViewController.swift
//  CoreMotion_Demo
//
//  Created by FelixZhao on 2020/3/5.
//  Copyright © 2020 FelixZhao. All rights reserved.
//

// https://www.hangge.com/blog/cache/detail_1548.html
// https://www.jianshu.com/p/c4fff00b50ff
// https://www.jianshu.com/p/844e61e1c219
// https://www.raywenderlich.com/6747815-uigesturerecognizer-tutorial-getting-started
// https://www.hangge.com/blog/cache/category_72_1.html
import UIKit
import CoreMotion

class ImageDemoViewController: UIViewController {
    var motionManager = CMMotionManager()
    var imageView:UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight))
        imageView.image = UIImage(named: "timg")
        view.addSubview(imageView)
        getDeviceMotion()
        // Do any additional setup after loading the view.
    }
    
    func getDeviceMotion() {
        if motionManager.isDeviceMotionAvailable && !motionManager.isDeviceMotionActive {
            motionManager.deviceMotionUpdateInterval = 0.2
            
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                
                let rotationAngle = atan2((data?.rotationRate.x)!, (data?.rotationRate.y)!) - .pi
                print(rotationAngle)
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(rotationAngle))
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
}
