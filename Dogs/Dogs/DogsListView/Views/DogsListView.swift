//
//  DogsListView.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import SwiftUI

struct DogsListView: View {
    @StateObject var vm: DogsListViewModel = DogsListViewModel()
    var body: some View {
        
        NavigationView{
            VStack{
                
                Text(ModuleStrings.DogsList.localized)
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding(.leading)
                
                ZStack{
                
                    CustomTextfield(text:$vm.searchText , placeHolder: ModuleStrings.Search.localized)
                    .padding()
             
                Image("Search")
                    .resizable()
                    .frame(maxWidth: 25, maxHeight: 25)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 30)
                    .onTapGesture {
                        vm.searchAction()
                    }
                
            }
                
                if !(vm.dogsDataModel.isEmpty){
                    ScrollView(showsIndicators: false){
                        LazyVGrid(columns:[GridItem(.flexible()),
                                           GridItem(.flexible())], spacing: 20 , content: {
                            ForEach(vm.dogsDataModel, id: \.self){ dogsData in
                                
                                NavigationLink(destination: DogsDetailView(dogsDataModel: dogsData)){
                                    DogListViewCard(title: dogsData.name, image: dogsData.image ?? "")
                                }
                            }
                        })
                        .padding(.horizontal)
                    }
                }else{
                    if vm.showNoNetworkView{
                        NoNetworkView {
                            vm.getDogsList()
                        }
                    }else{
                        if vm.noDataFound{
                            CustomNoDataFound()
                        }
                    }
                }
              
                Spacer()
            }
        }
    }
       
    }


#Preview {
    DogsListView()
}


