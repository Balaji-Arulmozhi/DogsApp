//
//  DogsDataModel.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import Foundation

struct DogsDataModel: Codable, Hashable{
    var name:String
    var image: String?
    var subBreed: [String?]
}
