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
    
    func setupHeader(clanPoints: String, clanVersusPoints: String, warWins: String, members: String, clanType: String, requiredTrophies: String, warFrequency: String, clanLocation: String, warWinStreak: String, badge: UIImage)
    {
        self.clanPointsLabel.text = clanPoints
        self.clanVersusPointsLabel.text = clanVersusPoints
        self.warWinsLabel.text = warWins
        self.membersLabel.text = members
        self.clanTypeLabel.text = clanType
        self.requiredPersonalTrophiesLabel.text = requiredTrophies
        self.requiredVersusTrophiesLabel.text = requiredTrophies
        self.warFrequencyLabel.text = warFrequency
        self.clanLocationName.text = clanLocation
        self.warWinStreakLabel.text = warWinStreak
        self.clanBadgeImageView.image = badge
    }
}
