//
//  ClanCell.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 24/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit

class ClanSearchCell: UICollectionViewCell
{
    // MARK: - Outlets
    
    @IBOutlet weak var clanBadgeImageView: UIImageView!
    @IBOutlet weak var clanNameLabel: UILabel!
    @IBOutlet weak var clanTypeLabel: UILabel!
    @IBOutlet weak var numberOfMembersLabel: UILabel!
    @IBOutlet weak var clanPointsLabel: UILabel!
    
    // MARK: - Custom Functions
    
    func cellSetup(color1: UIColor, color2: UIColor, clanBadgeImageUrl: String, clanName: String, clanType: String, numberOfMembers: String, clanPoints: String)
    {
        //Label corner rounding
        self.numberOfMembersLabel.layer.cornerRadius = 3.375
        self.numberOfMembersLabel.clipsToBounds = true
        self.clanPointsLabel.layer.cornerRadius = 4.5
        self.clanPointsLabel.clipsToBounds = true
        
        // Cell Background color
        self.clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1.cgColor , color2.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        // Cell Data
        self.clanBadgeImageView.sd_setImage(with: URL(string: clanBadgeImageUrl))
        self.clanNameLabel.text = clanName
        self.clanTypeLabel.text = clanType
        self.numberOfMembersLabel.text = numberOfMembers
        self.clanPointsLabel.text = clanPoints
    }
}
