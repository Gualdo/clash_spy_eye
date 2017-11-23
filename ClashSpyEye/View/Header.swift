//
//  File.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 16/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit

class Header: UICollectionReusableView
{
    // MARK: - Oulets
    
    @IBOutlet weak var clanPointsLabel: UILabel!
    @IBOutlet weak var clanVersusPointsLabel: UILabel!
    @IBOutlet weak var warWinsLabel: UILabel!
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var clanTypeLabel: UILabel!
    @IBOutlet weak var requiredPersonalTrophiesLabel: UILabel!
    @IBOutlet weak var requiredVersusTrophiesLabel: UILabel!
    @IBOutlet weak var warFrequencyLabel: UILabel!
    @IBOutlet weak var clanLocationName: UILabel!
    @IBOutlet weak var warWinStreakLabel: UILabel!
    @IBOutlet weak var clanBadgeImageView: UIImageView!
    @IBOutlet weak var clanDescriptionTextView: UITextView!
    @IBOutlet weak var clanTagLabel: UILabel!
    @IBOutlet weak var clanNameLabel: UILabel!
    
    // MARK: - Custom Functions
    
    func setupHeader(clanPoints: String, clanVersusPoints: String, warWins: String, members: String, clanType: String, requiredPersonalTrophies: String, requiredVersusTrophies: String, warFrequency: String, clanLocation: String, warWinStreak: String, badgeUrl: String, clanDescription: String, clanTag: String, clanName: String)
    {
        self.clanPointsLabel.text = clanPoints
        self.clanVersusPointsLabel.text = clanVersusPoints
        self.warWinsLabel.text = warWins
        self.membersLabel.text = members
        self.clanTypeLabel.text = clanType
        self.requiredPersonalTrophiesLabel.text = requiredPersonalTrophies
        self.requiredVersusTrophiesLabel.text = requiredVersusTrophies
        self.warFrequencyLabel.text = warFrequency
        self.clanLocationName.text = clanLocation
        self.warWinStreakLabel.text = warWinStreak
        self.getImage(badgeUrl, self.clanBadgeImageView)
        self.clanDescriptionTextView.text = clanDescription
        self.clanTagLabel.text = clanTag
        self.clanNameLabel.text = clanName
    }
    
    func getImage(_ urlStr: String, _ imageView: UIImageView)
    {
        let url: URL = URL(string: urlStr)!
        let session = URLSession.shared
        
        let task = session.dataTask(with: url, completionHandler:
        {(data, response, error) in
            
            if data != nil
            {
                let image = UIImage(data: data!)
                
                if(image != nil)
                {
                    DispatchQueue.main.async(execute: {
                        
                        imageView.image = image
                        imageView.alpha = 0
                        
                        UIView.animate(withDuration: 2.5, animations: {
                            imageView.alpha = 1.0
                        })
                    })
                }
            }
        })
        
        task.resume()
    }
}
