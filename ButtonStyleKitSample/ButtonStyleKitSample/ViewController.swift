//
//  ViewController.swift
//  ButtonStyleKitSample
//
//  Created by keygx on 2016/08/04.
//  Copyright © 2016年 keygx. All rights reserved.
//

import UIKit
import ButtonStyleKit

class ViewController: UIViewController {

    @IBOutlet weak var button: SampleButtonStandardStyle!
    @IBOutlet weak var buttonWithImage: SampleButtonStandardWithImageStyle!
    
    @IBOutlet weak var buttonWithImageOnRight: SampleButtonExpandCollapseStyle!
    
    @IBOutlet weak var checkbox: SampleButtonCheckboxStyle!
    @IBOutlet weak var radioA: SampleButtonRadioStyle!
    @IBOutlet weak var radioB: SampleButtonRadioStyle!
    @IBOutlet weak var radioC: SampleButtonRadioStyle!
    
    var group: RadioGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var array = [radioA!, radioB!, radioC!]
        group = RadioGroup(buttons: &array)
        
        // Standard Button
        button.tag =  1
        button.setClickHandler { sender in
            print("clicked tag: \(sender.tag)")
        }
        
        // button with image
        buttonWithImage.setTitle("long arrow", for: .normal)
        buttonWithImage.setImage(UIImage(named: "arrow")!, for: .normal)
        buttonWithImage.setImage(UIImage(named: "arrow-highlighted")!, for: .highlighted)

        // button with image on the right
        buttonWithImageOnRight.setTitle("expand", for: .normal)
        buttonWithImageOnRight.setTitle("collapse", for: .selected)

        buttonWithImageOnRight.setImage(UIImage(named: "expand")!, for: .normal)
        buttonWithImageOnRight.setImage(UIImage(named: "collapse")!, for: .selected)
        buttonWithImageOnRight.setClickHandler { [unowned self] sender in
            self.buttonWithImageOnRight.value = !self.buttonWithImageOnRight.value
        }

        
        radioOnOff()
        
        // Checkbox
        checkbox.setClickHandler { [unowned self] sender in
            self.checkbox.value = !self.checkbox.value
            print("checkbox: \(self.checkbox.value)")
            
            self.radioOnOff()
        }
        
        // Radio
        radioA.setClickHandler { [unowned self] sender in
            self.group?.select(index: 0)
            self.group?.printValues()
        }
        radioB.setClickHandler { [unowned self] sender in
            self.group?.select(index: 1)
            self.group?.printValues()
        }
        radioC.setClickHandler { [unowned self] sender in
            self.group?.select(index: 2)
            self.group?.printValues()
        }

    }
    
    func radioOnOff() {
        if self.checkbox.value {
            group?.enabled()
        } else {
            group?.disabled()
        }
        
        group?.printValues()
    }

    // Button Style Change
    @IBAction func btn1NormalAction(sender: UIButton) {
        button.currentState = .normal
    }
    @IBAction func btn1HighlightedAction(sender: UIButton) {
        button.currentState = .highlighted
    }
    @IBAction func btn1DisabledAction(sender: UIButton) {
        button.currentState = .disabled
    }
}
