//
//  LocationMapAnnotationView.swift
//  ErasmusMapApp
//
//  Created by Emirhan Gökçe on 23.01.2026.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor : Color = Color("AccentColor")
    var body: some View {
        VStack(spacing:0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .font(.headline)
                .foregroundStyle(.white)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
                
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .foregroundStyle(accentColor)
                .rotationEffect(.degrees(180))
                .offset(y: -3)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LocationMapAnnotationView()
    }
}
