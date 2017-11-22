//
//  ClanController.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 13/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON
import KVNProgress
import LBTAComponents

class ClanInfo: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    //MARK: - Global Variables
    
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
    var clanMembers = [String : Any]()
    
    // MARK: - ClanInfo Life Cicle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()     
    }
    
    override func viewWillLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
    }
    
    func reloadDataNow()
    {
        self.collectionView?.reloadData()
        KVNProgress.showSuccess()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as! PlayerCell
        
        if indexPath.row == 0
        {
            cell.cellSetupFirstCell(color1: UIColor(r: 216.0, g: 204.0, b: 188.0))
        }
        else
        {
            cell.cellSetup(color1: UIColor(r: 234.0, g: 234.0, b: 234.0), color2: UIColor(r: 170.0, g: 170.0, b: 170.0))
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.frame.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "clanHeader", for: indexPath) as! Header
        
        header.setupHeader(clanPoints: self.clanPoints, clanVersusPoints: self.clanVersusPoints, warWins: self.warWins, members: self.numberOfMembers, clanType: self.clanType, requiredPersonalTrophies: self.requiredPersonalTrophies, requiredVersusTrophies: self.requiredVersusTrophies, warFrequency: self.warFrequency, clanLocation: self.clanLocationName, warWinStreak: self.warWinStreak, badgeUrl: self.clanBadgeUrl, clanDescription: self.clanDescription, clanTag: self.clanTag, clanName: self.clanName)
        
        return header
    }
}
