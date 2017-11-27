//
//  ClanNameSearch.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 24/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import SwiftyJSON
import KVNProgress

class ClanNameSearch: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    // MARK: - Global Variables
    
    // Clan Info Variables
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
    
    // Members Info Variables
    var membersArray = [[String : Any]]()
    var memberLeagueImageUrl = [String]()
    
    // ClanNameSearch Variables
    var clanList = [JSON]()
    
    // MARK: - ClanNameSearch life cicle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.clanList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clanSearchCell", for: indexPath) as! ClanSearchCell
        
        cell.cellSetup(color1: UIColor(red: 234.0/255.0, green: 234.0/255.0, blue: 234.0/255.0, alpha: 1.0), color2: UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0), clanBadgeImageUrl: clanList[indexPath.row]["badgeUrls"]["large"].stringValue, clanName: clanList[indexPath.row]["name"].stringValue, clanType: clanList[indexPath.row]["type"].stringValue, numberOfMembers: String(clanList[indexPath.row]["members"].intValue), clanPoints: String(clanList[indexPath.row]["clanPoints"].intValue))
        
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        KVNProgress.show(withStatus: "Loading")
        
        RequestInfo.clanTag = self.clanList[indexPath.row]["tag"].stringValue
        self.clanTag = RequestInfo.clanTag
        
        Service.sharedInstance.retrieveClanInfo(completion: { (clanBadgeUrl, clanDescription, clanLocationName, clanPoints, clanType, clanVersusPoints, numberOfMembers, requiredPersonalTrophies, requiredVersusTrophies, warFrequency, warWins, warWinStreak, clanName, membersArray, memberLeagueImageUrl) in
            
            // Clan Info Variables
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
            
            // Members Info Variables
            self.membersArray = membersArray
            self.memberLeagueImageUrl = memberLeagueImageUrl
            
            KVNProgress.showSuccess()
            
            self.performSegue(withIdentifier: "goToClanInfoFromNameSearch", sender: nil)
        })
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goToClanInfoFromNameSearch"
        {
            if let clanInfoSegue = segue.destination as? ClanInfo
            {
                // Clan info Variables
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
                
                // Members Info Variable
                clanInfoSegue.membersAray = self.membersArray
                clanInfoSegue.memberLeagueImageUrl = self.memberLeagueImageUrl
            }
        }
    }
}
