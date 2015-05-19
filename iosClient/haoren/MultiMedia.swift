//
//  MultiMedia.swift
//  haoren
//
//  Created by Zide Meng on 5/18/15.
//  Copyright (c) 2015 cooldown. All rights reserved.
//

import Foundation
class MultiMedia{
    
    var isImage = false
    var isLabel = false
    var isNeedLargeFontSize = false //only for the first title line.
    
    var text : String?
    var imageName : String?
    
    
    
    func initWithValue( isImage: Bool, isLabel: Bool, isNeedLargeFontSize: Bool , text: String?, imageName: String?  ){
        self.isImage = isImage
        self.isLabel = isLabel
        self.isNeedLargeFontSize = isNeedLargeFontSize
        self.text = text
        self.imageName = imageName
        
    }
}