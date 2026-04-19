//
//  LocationsListView.swift
//  ErasmusMapApp
//
//  Created by Emirhan Gökçe on 8.01.2026.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations) {location in
                Button(action: {
                    vm.showNextLocation(location: location)
                }, label: {
                    listRowView(location: location)

                })
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle()) //TODO: Bu ne
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

extension LocationsListView{
    //Dışarıdan parametre alabildiği için func kullanıyoruz diğer sabit extensionların aksine
    private func listRowView(location : Location) -> some View{
        HStack{
            //TODO: .first olduğu için Optinaol. dolu.first   // Optional("kolezyum")
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }

    }
}
