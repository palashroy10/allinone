//
//  Support.swift
//  AllUNeed
//
//  Created by Palash Roy on 08/06/20.
//  Copyright © 2020 Palash Roy. All rights reserved.
//

import Foundation
func getTimeDiff(start: String, end: String)->String {
    let startComp = start.split(separator: ":")
    let lastMin = Int(String(startComp[0]))! * 600
    let lastSec = Int(String(startComp[1]))! * 10
    let lastMiliSec = Int(String(startComp[2]))!
    
    let endComp = end.split(separator: ":")
    let lastMin2 = Int(String(endComp[0]))! * 600
    let lastSec2 = Int(String(endComp[1]))! * 10
    let lastMiliSec2 = Int(String(endComp[2]))!
    
    let startVal:Int = lastMiliSec + lastMin + lastSec
    let endVal:Int = lastMiliSec2 + lastMin2 + lastSec2
    let diff = endVal - startVal
    let minval = diff/600
    
    var miliSecVal = diff%600
    let secVal = miliSecVal/10
    miliSecVal = miliSecVal%10
    let diffVal = "\(minval):\(secVal):\(miliSecVal)"
    return diffVal
    
}
