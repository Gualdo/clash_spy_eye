//
//  ClanTagService.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 20/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

class ClanTagService: JSONDecodable
{
    var clanTag = String()
    
    required init(json: JSON) throws
    {
        print("Now ready to parse JSON from retrieveClanTag: \n", json)
        
        let array = json["items"].array
        
        for clanJson in array!
        {
            self.clanTag = clanJson["tag"].stringValue
        }
    }
}
