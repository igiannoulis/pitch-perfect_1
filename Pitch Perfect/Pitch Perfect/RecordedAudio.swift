//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Hlias Giannoulis on 3/22/15.
//  Copyright (c) 2015 Hlias Giannoulis. All rights reserved.
//

import Foundation

import Foundation


import Foundation


class RecordedAudio: NSObject
    
{
    var filePathURL: NSURL
    var title: String
    
    init(filePathUrl: NSURL, title: String){
        self.filePathURL = filePathUrl
        self.title = title
        
    }
}