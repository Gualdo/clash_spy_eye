//
//  ViewController.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 7/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

// Font Supercell-Magic

import UIKit
import LBTAComponents

class Home: UIViewController
{
    // MARK: - Outlets
    
    @IBOutlet weak var clanSearchTextField: UITextField!    
    @IBOutlet weak var playerSearchTextField: UITextField!
    @IBOutlet weak var clanSearchButton: UIButton!
    @IBOutlet weak var playerSearchButton: UIButton!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    // MARK: - Home Load
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.clanSearchTextField.delegate = self
        self.playerSearchTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.topConstraint.constant = (self.view.frame.size.height - (self.clanSearchButton.frame.size.height + self.playerSearchButton.frame.height + self.clanSearchTextField.frame.size.height + self.playerSearchTextField.frame.size.height))/2
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
