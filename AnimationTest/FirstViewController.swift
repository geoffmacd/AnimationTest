//
//  FirstViewController.swift
//  AnimationTest
//
//  Created by Xtreme Dev on 2014-06-11.
//  Copyright (c) 2014 GeoffMacDonald. All rights reserved.
//

import UIKit
import QuartzCore

class FirstViewController: UIViewController {
    
    
    @IBOutlet var rectangle : RoundedRect
    @IBOutlet var square : RoundedRect
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Basic Animations"
        
        self.rectangle.corner = 10
    }
    
    override func viewDidAppear(animated: Bool) {
        
        var ani = CABasicAnimation(keyPath: "position.x")
        ani.fromValue = square.bounds.size.width/2
        ani.toValue = UIScreen.mainScreen().bounds.size.width + square.bounds.size.width/2
        ani.duration = 2
        ani.repeatCount = HUGE
        
        square.layer.addAnimation(ani, forKey: "Traveling")
        
        
        var ani2 = CABasicAnimation(keyPath: "position.x")
        ani2.fromValue = rectangle.bounds.size.width/2
        ani2.toValue = UIScreen.mainScreen().bounds.size.width + rectangle.bounds.size.width/2
        ani2.duration = 2
        ani2.repeatCount = HUGE
        ani2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    
        
        rectangle.layer.addAnimation(ani, forKey: "Following")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


