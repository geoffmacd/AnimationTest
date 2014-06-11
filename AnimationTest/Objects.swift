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


    @IBInspectable var corner:Int = 40
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    override func drawRect(rect:CGRect){

        //add layers

        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height), cornerRadius: Double(corner))

        UIColor.greenColor().setFill()

        path.fill()

    }
    
}
