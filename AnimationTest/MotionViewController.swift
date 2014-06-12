//
//  MotionViewController.swift
//  AnimationTest
//
//  Created by Xtreme Dev on 2014-06-12.
//  Copyright (c) 2014 GeoffMacDonald. All rights reserved.
//

import UIKit
import QuartzCore

class MotionViewController: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        
        var alert = UIAlertController(title: "geoff:", message: "message", preferredStyle: .Alert)
        
        var action = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler:{
            action in
            println("action :\(action.description)")
            })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion:{
            alert.view.addMotionEffect(customEffect())
            
            });
    }
    
    
    
}

class customEffect:UIMotionEffect{
    
    override func keyPathsAndRelativeValuesForViewerOffset(viewerOffset: UIOffset) -> NSDictionary! {
        
        println("\(viewerOffset.vertical)")
        
        let point = NSValue(CGPoint: CGPoint(x: 20, y: 20))
        
        return ["center":point]
        
    }
}

