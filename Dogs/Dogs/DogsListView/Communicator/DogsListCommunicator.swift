//
//  DogsListCommunicator.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import Foundation
import Combine

class DogsListCommunicator{
 
   static func getDogsList() -> AnyPublisher<DogsListModel, NetworkError>{
        return Webservice.shared.getMethod(path: "/breeds/list/all", isMock: false, type: DogsListModel.self, failureScenerio: false, mockPath: "")
    }
    
    static func getImage(name: String) -> AnyPublisher<DogsImageModel, NetworkError>{
        return Webservice.shared.getMethod(path: "/breed/\(name)/images/random", isMock: false, type: DogsImageModel.self, failureScenerio: false, mockPath: "")
    }
}
