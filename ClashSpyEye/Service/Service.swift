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

struct Service
{
    // MARK: - Global Variables
    
    let tron = TRON(baseURL: ServerData.apiUrl + ServerData.apiVersion)
    
    // MARK: - Shared Instance
    
    static let sharedInstance = Service()
    
    func retrieveClanTag(completion: @escaping ((String) -> Void))
    {
        let request: APIRequest<ClanTagService, JSONError> = tron.request(ServerData.clanNameRequest)
        request.headers = ["Content-Type":"application/json"]
        
        let header = request.headerBuilder.headers(forAuthorizationRequirement: .allowed, including: ["Content-Type":"application/json", "Authorization": "Bearer " + ServerData.ip200Token])
        request.headers = header
        
        request.parameters = [ServerData.clanNameRequestParameter : "team_tera"]
        
        request.perform(withSuccess: { (tag) in
            
            print("Successfully fetched out JSON Objects")
            
            completion(tag.clanTag)
            
        }) { (err) in
            print("Failed to fetch JSON...", err)
        }
    }
}
