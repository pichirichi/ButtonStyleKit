//
//  SampleButtonStandardWithImageStyle.swift
//  ButtonStyleKitSample
//
//  Created by keygx on 2016/08/04.
//  Copyright © 2016年 keygx. All rights reserved.
//

import UIKit
import ButtonStyleKit

final class SampleButtonStandardWithImageStyle: ButtonStyleStandardBase {

    private let buttonStyle = ButtonStyleBuilder()
    
    final override func initializedTrigger() {
        let blue = UIColor(red: 0.0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        let orange = UIColor.orange
        
        /*---------- Common Settings ----------*/
        buttonStyle
            .setButton(self)
            .setState(.all)
            .setTitleColor(blue)
            .setBorderColor(blue)
            .setFont(UIFont.systemFont(ofSize: 16))
            .setCornerRadius(8.0)
            .setBorderWidth(1.0)

            // |-5-icon-5-text-5-|
            .setContentEdgeInsets(top: 0, right: 10, bottom: 0, left: 5)
            .setTitleEdgeInsets(top: 0, right: -5, bottom: 0, left: 5)
            
            .setClipsToBounds(true)
            .setExclusiveTouch(true)
            .build()
        
        /*---------- For State Settings ----------*/
        buttonStyle
            .setState(.highlighted)
            .setTitleColor(orange)
            .setBorderColor(orange)
            .build()

        buttonStyle.apply()
    }
    
    final override var currentState: ButtonStyleKit.ButtonState {
        didSet {
            buttonStyle.apply()
        }
    }
}
