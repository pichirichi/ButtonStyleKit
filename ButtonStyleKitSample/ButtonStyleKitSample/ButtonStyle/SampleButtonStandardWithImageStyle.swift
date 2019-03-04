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
        let white = UIColor.white
        let orange = UIColor.orange
        let lightGray = UIColor.lightGray
        let whiteImage = buttonStyle.createViewToImage(color: white)
        
        /*---------- Common Settings ----------*/
        buttonStyle
            .setButton(self)
            .setState(.all)
            .setFont(UIFont.systemFont(ofSize: 16))
            .setCornerRadius(8.0)
            .setBorderWidth(1.0)
            .setTitleEdgeInsets(top: 0, right: -10, bottom: 0, left: 20)
            .setImageEdgeInsets(top: 0, right: -10, bottom: 0, left: 10)
            .setClipsToBounds(true)
            .setExclusiveTouch(true)
            .build()
        
        /*---------- For State Settings ----------*/
        buttonStyle
            .setState(.normal)
            .setTitle("normal")
            .setTitleColor(blue)
            .setBackgroundImage(whiteImage!)
            .setBorderColor(blue)
            .build()
        
        buttonStyle
            .setState(.highlighted)
            .setTitle("highlighted")
            .setTitleColor(orange)
            .setBackgroundImage(whiteImage!)
            .setBorderColor(orange)
            .build()
        
        buttonStyle
            .setState(.disabled)
            .setTitle("disabled")
            .setTitleColor(lightGray)
            .setBackgroundImage(whiteImage!)
            .setBorderColor(lightGray)
            .build()
        
        buttonStyle.apply()
    }
    
    final override var currentState: ButtonStyleKit.ButtonState {
        didSet {
            buttonStyle.apply()
        }
    }
}
