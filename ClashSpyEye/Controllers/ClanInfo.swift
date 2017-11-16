//
//  ClanController.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 13/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import TRON

class ClanInfo: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    // MARK: - Global Variables
    
    var players: [Player] = {
        return player
    }()
    
    // MARK: - ClanInfo Life Cicle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
            cell.cellSetupFirstCell(color1: UIColor(r: 172.0, g: 160.0, b: 144.0))
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
