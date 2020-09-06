//
//  ColorPickerControl.swift
//  organizer_app
//
//  Created by User on 2020-09-05.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import UIKit

@IBDesignable class ColorPickerControl: UIStackView {

    //MARK: Properties
    private var colorButtonsArr = [UIButton]()
    public var selectedColor : UIColor?
    
    //Color Array
    private var colorArr : [UIColor] = [
        UIColor.systemRed,
        UIColor.systemOrange,
        UIColor.systemYellow,
        UIColor.systemBlue,
        UIColor.systemTeal,
        UIColor.systemIndigo,
        UIColor.systemGreen
    ]
    
    //MARK: Initialization
    override required init(frame: CGRect){
        super.init(frame: frame)
        setupButtons()
    }
    
    //init for storyboarding
    required init(coder: NSCoder){
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private Methods
    @objc private func buttonTapped(button: UIButton){
        
        //user deselects button
        if button.backgroundColor == selectedColor {
            selectedColor = nil
            button.alpha = 1.0
        }else{
            for button in colorButtonsArr{
                button.alpha = 1.0
            }
            selectedColor = button.backgroundColor
            button.alpha = 0.3
        }
    }
    
    private func setupButtons(){
        for i in 0 ... 6{
            
            //create button
            let button = UIButton()
            
            //add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44).isActive = true
            button.layer.cornerRadius = 8
            button.clipsToBounds = true
            
            
            //add button action
            button.addTarget(self, action: #selector(ColorPickerControl.buttonTapped(button:)), for: .touchUpInside)
            
            button.backgroundColor = colorArr[i]
            
            //add button to stack view
            addArrangedSubview(button)
            
            colorButtonsArr.append(button)
        }
    }
}
