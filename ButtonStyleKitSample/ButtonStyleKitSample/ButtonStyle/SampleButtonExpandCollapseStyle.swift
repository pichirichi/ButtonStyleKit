//
//  SampleButtonExpandCollapseStyle.swift
//  ButtonStyleKitSample
//
//  Created by Shai Shamir on 05/03/2019.
//  Copyright © 2019 keygx. All rights reserved.
//

import UIKit
import ButtonStyleKit

final class SampleButtonExpandCollapseStyle: ButtonStyleSelectableBase {
    
    private let buttonStyle = ButtonStyleBuilder()
    
    final override func initializedTrigger() {
        let blue = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        let orange = UIColor.orange
        
        /*---------- Common Settings ----------*/
        buttonStyle
            .setButton(self)
            .setState(.all)
            .setTitleColor(blue)
            .setFont(UIFont.systemFont(ofSize: 16))
            
            // |-5-text-5-icon-5-|
            .setContentEdgeInsets(top: 0, right: 10, bottom: 0, left: 5)
            .setTitleEdgeInsets(top: 0, right: -5, bottom: 0, left: 5)
            
            .setClipsToBounds(true)
            .setExclusiveTouch(true)
            .build()
        
        /*---------- For State Settings ----------*/
        buttonStyle
            .setState(.highlighted)
            .setTitleColor(orange)
            .build()
        
        /*------- Flipp image to the right -------*/
        self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        self.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)

        buttonStyle.apply()
    }
    
}
