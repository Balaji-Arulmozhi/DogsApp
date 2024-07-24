//
//  DogsDetailView.swift
//  Dogs
//
//  Created by Kumararaja Krishnan on 7/23/24.
//

import SwiftUI

struct DogsDetailView: View {
    @StateObject var vm: DogsDetailViewModel = DogsDetailViewModel()
    var dogsDataModel: DogsDataModel
    @State var selectedText: String = ""
    @State var name: String = ""
    @State var image: String = ""

    var body: some View {
        VStack{
            
            
            Menu {
                ForEach(Array(dogsDataModel.subBreed.enumerated()), id: \.offset){ index, data in
                    Button(data ?? "" , action: {
                        vm.name = dogsDataModel.subBreed[index] ?? ""
                        vm.getImage()
                    })
                }
            } label: {
                HStack{
                    Text(ModuleStrings.SelectSubBreed.localized)
                        .foregroundStyle(dogsDataModel.subBreed.isEmpty ? .gray : .black)
                       
                    Spacer()
                        .frame(width: 10)
                    
                    Image("DownArrow")
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 5)
                    .stroke( dogsDataModel.subBreed.isEmpty ? .gray : .orange , lineWidth: 0.7))
            }
            .disabled(dogsDataModel.subBreed.isEmpty)
            
            
            Text(vm.name)
                .font(.largeTitle)
    
            AsyncImage(url: URL(string: vm.image)) { image in
                image.resizable()
                    .padding()
            } placeholder: {
               CustomDogPlaceholder()
                    
            }
            .frame(width: UIScreen.main.bounds.width,
                   height: UIScreen.main.bounds.width)
            .padding([.leading, .trailing])
        }
        .onAppear(){
            vm.name = dogsDataModel.name
            vm.image = dogsDataModel.image ?? ""
        }
    }
}

#Preview {
    DogsDetailView(dogsDataModel: DogsDataModel(name: "Name", subBreed: ["subbreed","subbreed"]))
}
