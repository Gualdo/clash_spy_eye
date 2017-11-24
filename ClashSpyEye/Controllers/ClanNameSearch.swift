//
//  ClanNameSearch.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 24/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit

class ClanNameSearch: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: view.frame.width, height: 40)
    }
}
