//
//  PlayerCell.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 14/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit

class PlayerCell: UICollectionViewCell
{
    //MARK: - Outlets
    
    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var levelImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var donatedTroopsLabel: UILabel!
    @IBOutlet weak var receivedTroopsLabel: UILabel!
    @IBOutlet weak var battlePointsLabel: UILabel!
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    @IBOutlet weak var viewFour: UIView!
    @IBOutlet weak var donatedTroopsTitleLabel: UILabel!
    @IBOutlet weak var clanPositionLabel: UILabel!
    @IBOutlet weak var thophyImageView: UIImageView!
    @IBOutlet weak var receivedTroopsTitleLablel: UILabel!
    @IBOutlet weak var playerLvlLabel: UILabel!
    
    //MARK: - PlayerCell Custom Functions
    
    func cellSetup(color1: UIColor, color2: UIColor, clanPosition: String, leagueImage: UIImage, playerLevel: String, playerName: String, donatedTroops: String, receivedTroops: String, battlePoints: String)
    {
        //Label corner rounding
        self.donatedTroopsLabel.layer.cornerRadius = 3.375
        self.donatedTroopsLabel.clipsToBounds = true
        self.receivedTroopsLabel.layer.cornerRadius = 3.375
        self.receivedTroopsLabel.clipsToBounds = true
        self.battlePointsLabel.layer.cornerRadius = 4.5
        self.battlePointsLabel.clipsToBounds = true
        
        // Cell Background color
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1.cgColor , color2.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        // Cell Data
        self.clanPositionLabel.text = clanPosition
        self.leagueImage.image = leagueImage
        self.playerLvlLabel.text = playerLevel
        self.nameLabel.text = playerName
        self.donatedTroopsLabel.text = donatedTroops
        self.receivedTroopsLabel.text = receivedTroops
        self.battlePointsLabel.text = battlePoints
    }
}
