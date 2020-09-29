//
//  Tips.swift
//  S.O.F.E
//
//  Created by Meme Mhd on 28/09/2020.
//  Copyright © 2020 S.O.F.E. All rights reserved.
//

import Foundation


struct Tips: Codable {
    var title: String
    var image: String
    init(images: [String : Any]) {
        self.image = images["image"] as? String ?? ""
        self.title = images["title"] as? String ?? ""
    }
}
