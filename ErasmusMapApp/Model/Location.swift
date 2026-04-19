//
//  Location.swift
//  ErasmusMapApp
//
//  Created by Emirhan Gökçe on 7.01.2026.
//

import Foundation
import MapKit

struct Location : Identifiable, Equatable{
//    let id = UUID().uuidString
    let name : String
    let cityName : String
    let coordinates : CLLocationCoordinate2D
    let description : String
    let imageNames : [String]
    let link : String
    
    //Uygulamayı kapatıp açsanız bile Roma'daki Kolezyum'un ID'si hep aynı kalır. UUID() her seferinde rastgele yeni bir değer üretir.
    var id : String{
        return name + cityName
    }
    
    //TODO: Equatable. Fakat neden?
    //Normalde Swift, iki tane karmaşık Location nesnesinin birbirine eşit olup olmadığını bilemez. Biz ona şu kuralı koyuyoruz: "Eğer iki lokasyonun ID'si aynıysa, bunlar aynı yerdir. Tüm açıklamayı veya resimleri tek tek kontrol etmene gerek yok."
    //Default olarak swift, bütün verileri karşılaştırır. Ama benim için sadece ID lazım.
    /**
     I implemented Equatable to define a custom equality logic.
     Instead of comparing all properties, I compare only the id, because it uniquely identifies a location.
     This improves performance and ensures consistent identity checks, especially when working with SwiftUI lists.
     */
    //Custom
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id //Id'leri aynıysa aynı locationlardır.
    }
    
}

/*
 Location(
     name: "Colosseum",
     cityName: "Rome",
     coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
     description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
     imageNames: [
         "rome-colosseum-1",
         "rome-colosseum-2",
         "rome-colosseum-3",
     ],
     link: "https://en.wikipedia.org/wiki/Colosseum"),
 
 */
