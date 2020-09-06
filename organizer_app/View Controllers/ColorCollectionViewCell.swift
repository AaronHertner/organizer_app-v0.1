//
//  ColorCollectionViewCell.swift
//  organizer_app
//
//  Created by User on 2020-09-06.
//  Copyright © 2020 aaronhertner. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    override var isHighlighted: Bool{
        didSet{
            print("Touched")
        }
    }
}
