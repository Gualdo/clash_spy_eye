//
//  ClanInfoService.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 22/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON
import LBTAComponents

class ClanInfoService: JSONDecodable
{
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
    
    required init(json: JSON) throws
    {
        print("Now ready to parse JSON from retrieveClanInfo: \n", json)
        
        self.clanPoints = json["clanPoints"].stringValue
        self.clanVersusPoints = json["clanVersusPoints"].stringValue
        self.warWins = json["warWins"].stringValue
        self.numberOfMembers = json["members"].stringValue
        self.clanType = self.stringSpacingValidator(string: json["type"].stringValue).capitalized
        self.requiredPersonalTrophies = json["requiredTrophies"].stringValue
        self.requiredVersusTrophies = json["requiredTrophies"].stringValue
        self.warFrequency = self.stringSpacingValidator(string: json["warFrequency"].stringValue).capitalized
        self.clanLocationName = self.stringSpacingValidator(string: json["location"]["name"].stringValue).capitalized
        self.warWinStreak = json["warWinStreak"].stringValue
        self.clanBadgeUrl = json["badgeUrls"]["large"].stringValue
        self.clanDescription = self.stringSpacingValidator(string: json["description"].stringValue).capitalized
        self.clanName = json["name"].stringValue
    }
    
    func stringSpacingValidator(string: String) -> String // Separate th word on a string everytime finds an uppercase
    {
        var stringIndex = 0
        var modificableString = string
        
        for character in string
        {
            let str = String(character)        
            
            if str.uppercased() == str && stringIndex > 0
            {
                modificableString.insert(" ", at: modificableString.index(modificableString.startIndex, offsetBy: stringIndex))
                stringIndex += 1
            }
            
            stringIndex += 1
        }
        
        return modificableString
    }
}
