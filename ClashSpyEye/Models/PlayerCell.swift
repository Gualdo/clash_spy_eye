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
    
    //MARK: - PlayerCell Life Cicle
    
    func cellSetup(color1: UIColor, color2: UIColor)
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
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func cellSetupFirstCell(color1: UIColor)
    {
        //Label corner rounding
        
        self.donatedTroopsLabel.isHidden = true
        self.receivedTroopsLabel.isHidden = true
        self.battlePointsLabel.isHidden = true
        self.leagueImage.isHidden = true
        self.levelImage.isHidden = true
        self.nameLabel.isHidden = true
        self.viewOne.isHidden = true
        self.viewTwo.isHidden = true
        self.viewThree.isHidden = true
        self.viewFour.isHidden = true
        
        // Cell Background color
        
        self.backgroundColor = color1
    }
}
