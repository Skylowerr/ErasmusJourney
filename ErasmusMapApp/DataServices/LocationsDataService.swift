
import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Colosseum",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            description: "Özellikle Gladyatör izledikten sonra en çok merak ettiğim yerlerden birisiydi kendileri. EU vatandaşlarına 2 euro olan mekana 18 Euro vermek zorunda kalsam da değdi diyebilirim. 'Strength and Honor!'",
            imageNames: [
                "rome-colosseum-1",
                "rome-colosseum-2",
                "rome-colosseum-3",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(
            name: "Pantheon",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
            description: "Pantheon'un kolezyumdan daha eski olması ilgimi çekmişti açıkçası. Roma’da bütün tanrılara adanmış nadir tapınaklardan birisi diyebiliriz. Zemine baktığımda biraz eğimli olduğu, yerde delikler olduğunu ve yağmur yağdığında damlacıkların bu zemine gittiğini gözlemlemiş oldum. EU citizen olmasam da 3 Euro ile burayı da kapatmış oldum",
            imageNames: [
                "rome-pantheon-1",
                "rome-pantheon-2",
                "rome-pantheon-3",
            ],
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
        Location(
            name: "Trevi Fountain",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
            description: "Nam-ı diğer Aşıklar Çeşmesi. Çok dümen mekan diyebilirim. İçeriye 1 bozuk para atınca Romaya tekrar geleceğini, 2 bozuk para atınca İtalyada aşık olacağını, 3 bozuk para atınca evleneceğin rivayet edilir. Giriş ücretsizdi fakat 1 ay sonra 2 Euro giriş ücreti koymuşlar.",
            imageNames: [
                "rome-trevifountain-1",
                "rome-trevifountain-2",
                "rome-trevifountain-3",
                
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(
            name: "Eiffel Tower",
            cityName: "Paris",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            description: "Eyfel'i ilk gördüğümde ışık olmadan sadece boş bir metal parçası olduğunu gördüm. Akşam olunca ise ışıkları yanıyor, her saat başı 5 dakika parıldıyor. Seine Nehrinin yakınlarına oturup izlemesi de ayrı bir keyif elbet.",
            imageNames: [
                "paris-eiffeltower-1",
                "paris-eiffeltower-2",
                "paris-eiffeltower-3",
                "paris-eiffeltower-4"
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        Location(
            name: "Louvre Museum",
            cityName: "Paris",
            coordinates: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
            description: "Mona Lisa, Napolyon’un taç giyme tablosu gibi birçok önemli eseri barındıran bu müze gerçekten devasa. Sabah erken saate bilet aldığım için çok kalabalık olmadan önemli eserleri görebildim. Fakat içerisi karışık ve Osmanlıya ait pek bir eser göremedim. En azından öğrencilere bedava.",
            imageNames: [
                "paris-louvre-1",
                "paris-louvre-2",
                "paris-louvre-3",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
    ]
    
}
