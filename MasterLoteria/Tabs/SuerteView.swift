//
//  SuerteView.swift
//  MasterLoteria
//
//  Created by Carlos Escobar on 8/01/21.
//

import SwiftUI

struct SuerteView: View {
    @State var numeros = ""
    var body: some View {
        VStack{
            Text("Aca se generan 4 digitos automaticos para que puedas hacer tu loteria")
            Button(action: {
                numeros = ""
                for _ in 0...3{
                    self.numeros += "\(Int.random(in: 0..<9))"
                }
            }){
                Text("Generar")
            }
            Text("\(self.numeros)")
        }
    }
}

struct SuerteView_Previews: PreviewProvider {
    static var previews: some View {
        SuerteView()
    }
}
