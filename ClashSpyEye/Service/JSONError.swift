//
//  Error.swift
//  ClashSpyEye
//
//  Created by Eduardo de la Cruz on 20/11/17.
//  Copyright © 2017 Eduardo de la Cruz. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

class JSONError: JSONDecodable
{
    required init(json: JSON) throws
    {
        print("JSON Error")
    }
}
