//
//  File.swift
//  NewProject
//
//  Created by Yeo Hwee Lin on 6/17/17.
//  Copyright © 2017 Yeo Hwee Lin. All rights reserved.
//

import Foundation

struct MessageModel {
    var messageId: String?
    var name: String
    var body: String
    

    init(name: String, body: String){
        self.name = name
        self.body = body
    }
}
