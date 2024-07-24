//
//  DogsListModel.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import Foundation

struct DogsListModel: Codable, Hashable{
    let message: [String: [String?]]
    let status: String
}
