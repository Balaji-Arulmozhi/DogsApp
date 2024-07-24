//
//  DogsDetailViewModel.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/24/24.
//

import Foundation
import Combine

class DogsDetailViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var image: String = ""
    var cancellable = Set<AnyCancellable>()
    
    
    func getImage(){
        DogsDetailsCommunicator.getImage(name: name)
            .receive(on: DispatchQueue.main)
            .sink { sinkCompletion in
                switch sinkCompletion{
                case .finished:
                    break
                    
                case .failure(let error):
                    self.image = "animal.placeholder"
                    print("error \(error)")
                }
            } receiveValue: {[weak self]  dogsImageModel in
                self?.image = dogsImageModel.message
            }
            .store(in: &cancellable)

    }
    
    
}
