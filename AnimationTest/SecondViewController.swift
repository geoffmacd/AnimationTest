//
//  SecondViewController.swift
//  AnimationTest
//
//  Created by Xtreme Dev on 2014-06-11.
//  Copyright (c) 2014 GeoffMacDonald. All rights reserved.
//

import UIKit
import QuartzCore

class SecondViewController: UIViewController {
    
    
    @IBOutlet var square : RoundedRect

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "KeyFrame Animations"
        
        square.corner = 5
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        
        var ani = CAKeyframeAnimation(keyPath: "transform.rotation")
        ani.values = [M_PI_2,M_PI,-M_PI_4,0];
        ani.duration = 4
        ani.repeatCount = HUGE
        ani.calculationMode = kCAAnimationCubicPaced
        
        
        square.layer.addAnimation(ani, forKey: "rotation")
        
        
        var pathAni = CAKeyframeAnimation(keyPath: "position")
        var path = UIBezierPath(ovalInRect: view.bounds)
        pathAni.path = path.CGPath
        pathAni.duration = 4
        pathAni.repeatCount = HUGE
        pathAni.calculationMode = kCAAnimationPaced;
        
        
        square.layer.addAnimation(pathAni, forKey: "path")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


