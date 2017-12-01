//
//  Film.swift
//  LabAssignment
//
//  Created by Yudhvir Raj on 2017-12-01.
//  Copyright © 2017 Yudhvir Raj. All rights reserved.
//

import Foundation
import EVReflection

class Film : EVObject {
    var title:String = ""
    var episode_id:String = ""
    var opening_crawl:String = ""
    var director:String = ""
    var producer:String = ""
    var release_date:String = ""
    var characters:[String] = []
    var planets:[String] = []
    var starships:[String] = []
    var vehicles:[String] = []
    var species:[String] = []
    var created:String = ""
    var edited:String = ""
    var url:String  = ""
}
