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

class ClanInfo: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    //MARK: - Clan Header Variables
    
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
    
    // MARK: - Palyer Cells Variables
    
    var membersAray = [[String : Any]]()
    var memberLeagueImageUrl = [String]()
    
    // MARK: - ClanInfo Life Cicle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()     
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return (membersAray.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as! PlayerCell
        
        let member = membersAray[indexPath.row] as [String : Any]
        
        let clanPosition = String(member["clanRank"] as! Int)
        let playerLevel = String(member["expLevel"] as! Int)
        let playerName = member["name"] as! String
        let donatedTroops = String(member["donations"] as! Int)
        let receivedTroops = String(member["donationsReceived"] as! Int)
        let battlePoints = String(member["trophies"] as! Int)
        
        cell.cellSetup(color1: UIColor(red: 234.0/255.0, green: 234.0/255.0, blue: 234.0/255.0, alpha: 1.0), color2: UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0), clanPosition: (clanPosition + "."), memberLeagueImageUrl: self.memberLeagueImageUrl[indexPath.row], playerLevel: playerLevel, playerName: playerName, donatedTroops: donatedTroops, receivedTroops: receivedTroops, battlePoints: battlePoints)
        
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
