//
//  LocationPreviewView.swift
//  ErasmusMapApp
//
//  Created by Emirhan Gökçe on 22.01.2026.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    let location : Location
    var body: some View {
        
        HStack(alignment: .bottom, spacing : 0) {
            VStack(alignment: .leading , spacing : 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing:8){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
        
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
    .environmentObject(LocationsViewModel())
}


//TODO: Bunları extension şeklinde yapmak yerine yeni bir struct ile yapabilir miyiz? Fark ne olur?
/*
 struct LearnMoreButton: View {
     let location: Location
     @EnvironmentObject private var vm: LocationsViewModel
    Bunları yazdıktan sonra  var body: some View{} deyip View'ın içerisine buton komutlarını yazacaksın.
    Küçük bir şey yaptığımız için extension kullanabiliriz fakat büyüdükçe struct kullanmak daha mantıklı
 
 */
extension LocationPreviewView{
    private var imageSection : some View{
        ZStack{
            if let imageNames = location.imageNames.first{
                Image(imageNames)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100 , height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection : some View{
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment : .leading)
    }
    
    private var learnMoreButton : some View{
        //learnMoreButton
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Düşüncelerim")
                .font(.headline)
                .frame(width:125, height:35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton : some View{
        //nextButton
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Sonraki")
                .font(.headline)
                .frame(width:125, height:35)
        }
        .buttonStyle(.bordered)
    }
}
