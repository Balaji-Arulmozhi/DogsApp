//
//  DogsListViewModel.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import Foundation
import Combine

class DogsListViewModel: ObservableObject{
    @Published var searchText: String = ""
    @Published var dogsListModel: DogsListModel?
    var cancellable = Set<AnyCancellable>()
    @Published var dogsDataModel: [DogsDataModel] = []
    var  permanentdogsDataModel: [DogsDataModel] = []
    @Published var showNoNetworkView: Bool = false
    @Published var noDataFound:Bool = true
    
    init(){
        getDogsList()
    }
    
    func getDogsList(){
        if !(NetworkManager.shared.isConnect ?? false){
            showNoNetworkView = true
            return
        }
            showNoNetworkView = false
            DogsListCommunicator.getDogsList()
                .receive(on: DispatchQueue.main)
                .sink { sinkCompletion in
                    switch sinkCompletion{
                    case .finished:
                        self.noDataFound = false
                        break
                    case .failure(let error):
                        self.noDataFound = true
                        print("error \(error.localizedStrings)")
                    }
                } receiveValue: { [weak self] dogsListModel in
                    
                    self?.dogsListModel = dogsListModel
                    self?.convertDogsData()
                    
                }
                .store(in: &cancellable)
        
    }
    func convertDogsData(){
        for (name, subBreed) in dogsListModel?.message ?? [:] {
            DogsListCommunicator.getImage(name: name)
                .receive(on: DispatchQueue.main)
                .sink { sinkCompletion in
                    switch sinkCompletion{
                    case .finished:
                        break
                        
                    case .failure(let error):
                        print("error \(error)")
                    }
                } receiveValue: { [weak self] dogsImageModel in
                    let dogsDataModel = DogsDataModel(name: name,
                                                      image: dogsImageModel.message,
                                                      subBreed: subBreed)
                    self?.permanentdogsDataModel.append(dogsDataModel)
                    self?.dogsDataModel.append(dogsDataModel)
                }
                .store(in: &cancellable)
            
        }
    }
    
    func searchAction(){
        if searchText == ""{
            dogsDataModel = permanentdogsDataModel
            return
        }
        dogsDataModel =  permanentdogsDataModel.filter{ $0.name.localizedCaseInsensitiveContains(searchText)}
        if dogsDataModel.isEmpty{
            self.noDataFound = true
        }else{
            self.noDataFound = false
        }
    }
    
    
}
