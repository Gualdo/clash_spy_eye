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
import KVNProgress

class Home: UIViewController
{
    // MARK: - Global Variables
    
    var clanTag = String()
    var clanPoints = String()
    var clanVersusPoints = String()
    var warWins = String()
    var numberOfMembers = String()
    var clanType = String()
    var requiredPersonalTrophies = String()
    var requiredVersusTrophies = String()
    var warFrequency = String()
    var clanLocationName = String()
    var warWinStreak = String()
    var clanBadgeUrl = String()
    var clanDescription = String()
    var clanName = String()
    
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
        
        kvnConfiguration()
        self.clanSearchTextField.delegate = self
        self.playerSearchTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.topConstraint.constant = (self.view.frame.size.height - (self.clanSearchButton.frame.size.height + self.playerSearchButton.frame.height + self.clanSearchTextField.frame.size.height + self.playerSearchTextField.frame.size.height))/2
    }
    
    @IBAction func clanButtonPressed(_ sender: UIButton)
    {
        RequestInfo.clanName = self.clanSearchTextField.text!
        
        Service.sharedInstance.retrieveClanTag { (tag) in
            self.clanTag = tag
            
            Service.sharedInstance.retrieveClanInfo(completion: { (clanBadgeUrl, clanDescription, clanLocationName, clanPoints, clanType, clanVersusPoints, numberOfMembers, requiredPersonalTrophies, requiredVersusTrophies, warFrequency, warWins, warWinStreak, clanName) in
                
                self.clanBadgeUrl = clanBadgeUrl
                self.clanDescription = clanDescription
                self.clanLocationName = clanLocationName
                self.clanPoints = clanPoints
                self.clanType = clanType
                self.clanVersusPoints = clanVersusPoints
                self.numberOfMembers = numberOfMembers
                self.requiredPersonalTrophies = requiredPersonalTrophies
                self.requiredVersusTrophies = requiredVersusTrophies
                self.warFrequency = warFrequency
                self.warWins = warWins
                self.warWinStreak = warWinStreak
                self.clanName = clanName
                
                KVNProgress.showSuccess()
                
                self.performSegue(withIdentifier: "goToClanInfo", sender: nil)
            })         
        }
    }
    
    @IBAction func playerButtonPressed(_ sender: UIButton)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goToClanInfo"
        {
            if let clanInfoSegue = segue.destination as? ClanInfo
            {
                clanInfoSegue.clanTag = self.clanTag
                clanInfoSegue.clanBadgeUrl = self.clanBadgeUrl
                clanInfoSegue.clanDescription = self.clanDescription
                clanInfoSegue.clanLocationName = self.clanLocationName
                clanInfoSegue.clanPoints = self.clanPoints
                clanInfoSegue.clanType = self.clanType
                clanInfoSegue.clanVersusPoints = self.clanVersusPoints
                clanInfoSegue.numberOfMembers = self.numberOfMembers
                clanInfoSegue.requiredPersonalTrophies = self.requiredPersonalTrophies
                clanInfoSegue.requiredVersusTrophies = self.requiredVersusTrophies
                clanInfoSegue.warFrequency = self.warFrequency
                clanInfoSegue.warWins = self.warWins
                clanInfoSegue.warWinStreak = self.warWinStreak
                clanInfoSegue.clanName = self.clanName
            }
        }
        else
        {
            
        }
    }
}
