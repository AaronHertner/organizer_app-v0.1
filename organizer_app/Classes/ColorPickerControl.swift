//
//  ColorPickerControl.swift
//  organizer_app
//
//  Created by User on 2020-09-05.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import UIKit

@IBDesignable class ColorPickerControl: UIStackView {

    private var colorButtonsArr = [UIButton]()
    
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
        print("eat dicks")
    }
    
    private func setupButtons(){
        for _ in 0 ... 6{
            //create button
            let button = UIButton()
            
            //add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 12).isActive = true
            button.widthAnchor.constraint(equalToConstant: 12).isActive = true
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.clipsToBounds = true
            
            //add button action
            button.addTarget(self, action: #selector(ColorPickerControl.buttonTapped(button:)), for: .touchUpInside)
            
            button.backgroundColor = UIColor.black
            
            //add button to stack view
            addArrangedSubview(button)
            
            colorButtonsArr.append(button)
        }
    }
}
