//
//  InputAccView.swift
//  InputAccessoryViewDemo
//
//  Created by Adrian Kwiatkowski on 18/12/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import UIKit

class InputAccView: UIView {

    var hideButtonAction: ( () -> () )?
    
    @IBAction func hideButtonTapped(_ sender: Any) {
        hideButtonAction?()
    }
    
}
