//
//  LocationDetailView.swift
//  ErasmusMapApp
//
//  Created by Emirhan Gökçe on 23.01.2026.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    let location : Location
    
    @EnvironmentObject private var vm : LocationsViewModel
    var body: some View {
        ScrollView{
            VStack {
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                VStack(alignment: .leading, spacing :16){
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            }
        }
        .background(.ultraThinMaterial)
        .ignoresSafeArea()
        .onAppear {
            let region = MKCoordinateRegion(
                center: location.coordinates,
                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            )
            vm.mapCameraPosition = .region(region)
        }
        .overlay(backButton, alignment: .topLeading)

    }
}

#Preview {
    LocationDetailView(location: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationDetailView{
    private var imageSection : some View{
        TabView {
            ForEach(location.imageNames, id: \.self){ imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width) //cihaz iPad ise elleme, iPhone ise ayarla
                    .clipped() //scaledToFill kullanınca ekranın dışına taşabilir. Bu taşmayı önlemek için kullanılır
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle()) //TODO: Normalinden farkına bak

    }
    
    private var titleSection: some View{
        VStack(alignment: .leading, spacing: 8){
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View{
        VStack(alignment: .leading, spacing: 16){
            Text(location.description)
                .foregroundStyle(.black.opacity(0.8))
            
            if let url = URL(string: location.link){
                Link("Tarihine Bakayım", destination: url)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    )
                
            }
        }
    }
    
    private var mapLayer: some View {
        Map(position: $vm.mapCameraPosition) {
            Annotation(location.name, coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
        .mapStyle(.standard)
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    private var backButton: some View {
        Button(action: { vm.sheetLocation = nil }) {
            HStack(spacing: 6) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .semibold))
                Text("Geri")
                    .font(.system(size: 15, weight: .semibold))
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(
                Capsule(style: .continuous)
                    .fill(.ultraThinMaterial)
            )
            .overlay(
                Capsule(style: .continuous)
                    .strokeBorder(Color.black.opacity(0.15), lineWidth: 0.5)
            )
            .foregroundStyle(
                LinearGradient(colors: [Color.primary.opacity(0.9), Color.primary.opacity(0.6)], startPoint: .leading, endPoint: .trailing)
            )
            .shadow(color: Color.black.opacity(0.15), radius: 12, x: 0, y: 6)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .padding(.leading, 16)
        .padding(.top, 12)
        .accessibilityLabel(Text("Geri"))
        .accessibilityAddTraits(.isButton)
    }
}

