//
//  Model.swift
//  tableViewDisplayingJSON
//
//  Created by West Kraemer on 2/16/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import Foundation
import UIKit

struct DarkSky: Decodable {
    
    var currently : String?
    var daily : String
    var flags : String
    var hourly : String
    var latitude : Float
    var longitude : Float
    var minutely : String
    var offset : Int
    var timezone : String
    
}
