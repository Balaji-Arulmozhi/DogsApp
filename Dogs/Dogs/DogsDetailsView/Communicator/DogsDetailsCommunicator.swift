//
//  DogsDetailsCommunicator.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/24/24.
//

import Foundation
import Combine

class DogsDetailsCommunicator{
    
    static func getImage(name: String) -> AnyPublisher<DogsImageModel, NetworkError>{
        return Webservice.shared.getMethod(path: "/breed/\(name)/images/random", isMock: false, type: DogsImageModel.self, failureScenerio: false, mockPath: "")
    }
    
}
