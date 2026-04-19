import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // Tüm yüklenen lokasyonlar
    @Published var locations: [Location]
    
    // O an haritada odaklanılmış tek yer
    //Sen ne zaman mapLocationı değiştirirsen (örneğin listeden yeni bir yer seçtin), didSet anında çalışır ve updateMapRegion fonksiyonunu tetikleyerek haritayı oraya kaydırır.
    @Published var mapLocation: Location {
        didSet {
            // mapLocation her değiştiğinde haritayı o konuma kaydırır
            updateMapRegion(location: mapLocation)
        }
    }
    
    // YENİ: iOS 17+ Harita kamera pozisyonu
    // Eski mapRegion yerine artık bunu haritaya bağlayacağız
    @Published var mapCameraPosition: MapCameraPosition = .automatic
    
    // Zoom seviyesi sabitimiz
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    @Published var showLocationsList : Bool = false
    
    // Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations // DataService'den verileri çekiyoruz
        self.locations = locations //Buradaki locations içerisine atıyor. İsimler karışmasın diye self koyuyoruz
        
        // İlk açılışta ilk lokasyonu seçiyoruz
        let firstLocation = locations.first!
        self.mapLocation = firstLocation //self yazmasan da olur aslında çünkü başka mapLocation yok fakat alışkanlık haline getir
        
        // İlk açılışta haritayı ilk lokasyona kuruyoruz
        self.updateMapRegion(location: firstLocation)
    }
    
    // Haritayı fiziksel olarak güncelleyen fonksiyon
    //Dikkat: mapLocation değişince muhtemelen bir didSet var ve o updateMapRegion'ı çağırıyor
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            // mapRegion set etmek yerine kamera pozisyonunu güncelliyoruz
            mapCameraPosition = .region( //mapCameraPosition : değişince MapKit haritayı animasyonlu olarak o konuma taşır
                MKCoordinateRegion(
                    center: location.coordinates, // Nereye git?
                    span: mapSpan // Ne kadar zoom?
                )
            )
        }
    }
    
    //Listeyi aç/kapat
    func toggleLocationsList() {
        withAnimation(.easeInOut){
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location : Location){
        withAnimation(.easeInOut){
            mapLocation = location // Seçili konum güncellendi
            showLocationsList = false  // Liste otomatik kapandı
        }
    }
    
    //3 konum varsa : 0 → 1 → 2 → 0 → 1 → 2 →
    func nextButtonPressed(){
        //1- Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else{
            return
        }
        
        //2- Check if the nextButton is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else{
            // Geçersiz — Listenin sonuna gelindi, başa dön
            guard let firstLocation = locations.first else{return}
            showNextLocation(location: firstLocation)
            return
        }
        //Next location is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
    }
}
