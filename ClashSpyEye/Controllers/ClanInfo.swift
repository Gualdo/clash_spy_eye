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

class ClanInfo: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    // MARK: - Tron Json Classes
    
    class Home: JSONDecodable
    {
        required init(json: JSON) throws
        {
            print("Now ready to parse JSON: \n", json)
        }
    }
    
    class JSONError: JSONDecodable
    {
        required init(json: JSON) throws
        {
            print("JSON Error")
        }
    }
    
    // MARK: - Global Variables
    
    let tron = TRON(baseURL: ServerData.apiUrl + ServerData.apiVersion)
    
    // MARK: - ClanInfo Life Cicle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        retrieveApiInfo()
    }
    
    func retrieveApiInfo()
    {
        let request: APIRequest<Home, JSONError> = tron.request(ServerData.clanNameRequest + "team_tera")
        request.headers = ["Content-Type":"application/json"]
        
        let header = request.headerBuilder.headers(forAuthorizationRequirement: .required, including: ["Content-Type":"application/json", "Authorization": "Bearer " + ServerData.ip200Token])
        request.headers = header        
        request.perform(withSuccess: { (home) in
            print("Successfully fetched out JSON Objects")
        }) { (err) in
            print("Failed to fetch JSON...", err)
        }
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
        
        return header
    }
}
