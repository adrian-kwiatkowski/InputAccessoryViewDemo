//
//  ViewController.swift
//  InputAccessoryViewDemo
//
//  Created by Adrian Kwiatkowski on 18/12/2018.
//  Copyright © 2018 Adrian Kwiatkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var canBecomeFirstResponder: Bool { return true }
    
    var _inputAccessoryView: InputAccView!
    override var inputAccessoryView: InputAccView? {
        if _inputAccessoryView == nil {
            _inputAccessoryView = InputAccView.initFromNib()
            _inputAccessoryView.isHidden = true
        }
        
        return _inputAccessoryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showButtonTapped(_ sender: Any) {
        inputAccessoryView?.isHidden = false
        
        inputAccessoryView?.hideButtonAction = {
            self.inputAccessoryView?.isHidden = true
        }
    }
    
    @IBAction func endEditingButtonTapped(_ sender: Any) {
        view.endEditing(true)
        inputAccessoryView?.isHidden = true
    }
}

extension UIView {
    class func initFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?[0] as! T
    }
}
