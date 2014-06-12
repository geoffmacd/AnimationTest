//
//  DynamicViewController.swift
//  AnimationTest
//
//  Created by Xtreme Dev on 2014-06-12.
//  Copyright (c) 2014 GeoffMacDonald. All rights reserved.
//

import UIKit
import QuartzCore

class DynamicViewController: UIViewController,UICollisionBehaviorDelegate {
    
   var animator:UIDynamicAnimator?
    
    
    @IBOutlet var widget : RoundedRect
    @IBOutlet var square : RoundedRect
    
    
//    init(coder aDecoder: NSCoder!) {
//        
//        animator =  UIDynamicAnimator(referenceView: view)
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        animator =  UIDynamicAnimator(referenceView: view)
        
        square.corner = 5
        widget.corner = 4
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        animator!.removeAllBehaviors()
        
        
        //setup dynamics
        
        //add bouncing to widget
        var spring = UIAttachmentBehavior(item: widget, attachedToAnchor: CGPointMake(0, 0))
        spring.damping = 0.5
        animator!.addBehavior(spring)
        
        var gravity = UIGravityBehavior(items: [widget,square])
        animator!.addBehavior(gravity)
        
        var dens = UIDynamicItemBehavior(items: [square])
        dens.elasticity = 0.8
        animator!.addBehavior(dens)
        
        var boundsCollision = UICollisionBehavior(items: [square])
        boundsCollision.translatesReferenceBoundsIntoBoundary = true
        boundsCollision.collisionDelegate = self
        animator!.addBehavior(boundsCollision)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint){
        
        println("hit : \(item.description) with boundary \(identifier)")
    }
    
}


