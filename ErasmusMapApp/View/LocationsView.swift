import SwiftUI
import MapKit

struct LocationsView: View {
    // App dosyasından gelen ViewModel'i yakalıyoruz
    @EnvironmentObject private var vm: LocationsViewModel
    let maxWidthForIpad: CGFloat = 700
    
    var body: some View {
        ZStack {
            mapLayer
            .ignoresSafeArea()
            
            VStack(spacing:0){
                header
                    .frame(maxWidth: maxWidthForIpad)
                    .padding()
                
                Spacer()
                
                locationsPreviewStack
            }
            
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header : some View{
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(minHeight: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            .foregroundStyle(.black)

            
            if vm.showLocationsList{
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer : some View{
        Map(position: $vm.mapCameraPosition) { //ViewModel harita konumunu değiştirdiğinde harita oraya kayar; kullanıcı haritayı elle kaydırdığında ise bu değişken otomatik olarak güncellenir.
            ForEach(vm.locations) { location in //Her bir konumu harita üzerine tek tek yerleştiriyorsun.
                Annotation(location.name, coordinate: location.coordinates) { //Özelleştirilmiş iğne
                    LocationMapAnnotationView() //Oluşturduğum iğne
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .animation(Animation.easeInOut.delay(0.1))
                        .shadow(radius: 10)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            }
        }
    }
    
    private var locationsPreviewStack : some View{
        ZStack{
            ForEach(vm.locations){location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad) //Konum için
                        .frame(maxWidth: .infinity) //Animasyon için
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)
                            )
                        )
                }
                
            }
        }
    }
}
