//
//  Service.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 20/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON
import KVNProgress

struct Service
{
    // MARK: - Global Variables
    
    let tron = TRON(baseURL: ServerData.apiUrl + ServerData.apiVersion)
    
    // MARK: - Shared Instance
    
    static let sharedInstance = Service()
    
    func retrieveClanTag(completion: @escaping ((String) -> Void))
    {
        KVNProgress.show(withStatus: "Loading")
        
        let request: APIRequest<ClanTagService, JSONError> = tron.request(ServerData.clanNameRequest)
        request.headers = ["Content-Type":"application/json"]
        
        let header = request.headerBuilder.headers(forAuthorizationRequirement: .allowed, including: ["Content-Type":"application/json", "Authorization": "Bearer " + ServerData.ip200Token])
        request.headers = header
        
        request.parameters = [ServerData.clanNameRequestParameter : RequestInfo.clanName]
        
        request.perform(withSuccess: { (tag) in
            
            print("Successfully fetched out JSON Objects of retrieveClanTag Service")
            
            RequestInfo.clanTag = tag.clanTag
            
            completion(tag.clanTag)
            
        }) { (err) in
            
            KVNProgress.showError()
            print("Failed to fetch JSON of retrieveClanTag Service...", err)
        }
    }
    
    func retrieveClanInfo(completion: @escaping ((String, String, String, String, String, String, String, String, String, String, String, String, String, [[String : Any]], [UIImage]) -> Void))
    {
        let request: APIRequest<ClanInfoService, JSONError> = tron.request(ServerData.clanNameRequest + "/" + RequestInfo.clanTag)
        
        request.headers = ["Content-Type":"application/json"]
        
        let header = request.headerBuilder.headers(forAuthorizationRequirement: .allowed, including: ["Content-Type":"application/json", "Authorization": "Bearer " + ServerData.ip200Token])
        request.headers = header
        
        request.perform(withSuccess: { (clanInfo) in
            
            print("Successfully fetched out JSON Objects of retrieveClanInfo Service")
            
            completion(clanInfo.clanBadgeUrl, clanInfo.clanDescription, clanInfo.clanLocationName, clanInfo.clanPoints, clanInfo.clanType, clanInfo.clanVersusPoints, clanInfo.numberOfMembers, clanInfo.requiredPersonalTrophies, clanInfo.requiredVersusTrophies, clanInfo.warFrequency, clanInfo.warWins, clanInfo.warWinStreak, clanInfo.clanName, clanInfo.membersArray, clanInfo.membersImgageArray)
            
        }) { (err) in
            
            KVNProgress.showError()
            print("Failed to fetch JSON of retrieveClanTag Service...", err)
        }
    }
}
