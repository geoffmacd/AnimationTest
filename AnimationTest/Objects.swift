//
//  Runner.swift
//  AnimationTest
//
//  Created by Xtreme Dev on 2014-06-11.
//  Copyright (c) 2014 GeoffMacDonald. All rights reserved.
//

import UIKit

import QuartzCore
@IBDesignable class RoundedRect:UIView {

    var saveAnimations:Dictionary<String,CAAnimation>

    @IBInspectable var corner:Int = 40
    
    init(coder aDecoder: NSCoder!) {
        saveAnimations = Dictionary()
        super.init(coder: aDecoder)
    }

    override func drawRect(rect:CGRect){

        //add layers

        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height), cornerRadius: Double(corner))

        UIColor.greenColor().setFill()

        path.fill()

    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
    
        if let animations = layer.animationKeys(){
            
            for key : AnyObject in layer.animationKeys(){
                
                let ani = layer.animationForKey(key as String)
                saveAnimations[key as String] = ani
            }
            
            layer.removeAllAnimations()
            //drag
        }
    }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
        
        let touch : UITouch = touches.anyObject() as UITouch
        self.frame.origin = touch.locationInView(self.superview)

    }
    
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!)  {
        //resume
        
        for (key,ani) in saveAnimations{
            
            layer.addAnimation(ani, forKey: key)
        }
        
        saveAnimations.removeAll(keepCapacity: true)
    }
    
    
    
}
