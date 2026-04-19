//
//  ErasmusMapAppApp.swift
//  ErasmusMapApp
//
//  Created by Emirhan Gökçe on 7.01.2026.
//

import SwiftUI

@main
struct ErasmusMapAppApp: App {
    @StateObject private var vm = LocationsViewModel() //LocationsView içindeki bir butonun tetiklediği başka bir alt sayfada (örneğin LocationDetailView), bu vm nesnesine tek bir satırla erişebilirsiniz.

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm) //TODO: Bu ne işe yarıyor
        }
    }
}
