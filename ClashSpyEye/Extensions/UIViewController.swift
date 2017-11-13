//
//  UIViewController.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 13/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import KVNProgress

extension UIViewController : UITextFieldDelegate
{
    // MARK: - Hide Keyboard when hit Enter
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool // Hides keyboard when tap enter
    {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Hide When Tapping Arround
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        view.endEditing(true)
    }
    
    // MARK: - KVN Config
    
    func kvnConfiguration()
    {
        let configuration = KVNProgressConfiguration()
        
        configuration.isFullScreen = true
        configuration.errorColor = UIColor.red
        configuration.successColor = UIColor.green
        configuration.backgroundTintColor = UIColor(red: 52, green: 52, blue: 128, alpha: 0.4)
        
        KVNProgress.setConfiguration(configuration)
    }
}
