//
//  ContentView.swift
//  MasterLoteria
//
//  Created by Carlos Escobar on 8/01/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView{
                TabAyerView()
                .tabItem {
                    Text("Ayer")
                    Image(systemName: "calendar.badge.minus")
                }.navigationBarHidden(true)
                SuerteView()
                    .tabItem{
                        Text("Suerte")
                        Image(systemName: "hands.sparkles")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
