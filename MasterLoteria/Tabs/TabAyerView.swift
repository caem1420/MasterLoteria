//
//  TabAyerView.swift
//  MasterLoteria
//
//  Created by Carlos Escobar on 8/01/21.
//

import SwiftUI
import Alamofire


struct Datos: Hashable, Identifiable{
    var id = UUID()
    var name: String
    var href: String
}

struct TabAyerView: View {
    @State var ArrayDatosLoterias: [Datos] = [Datos]()
    @State var ArrayDatosChances: [Datos] = [Datos]()
    var body: some View {
        VStack{
            Text("Loterias")
                .bold()
            List(){
                ForEach(ArrayDatosLoterias, id:\.id){item in
                    NavigationLink(destination: MoreInfoView(href: item.href)){
                        HStack{
                            Text(item.name)
                        }
                    }
                }
            }.onAppear{
                self.ArrayDatosLoterias = [Datos]()
                AF.request("http://192.168.0.10:3000/loteriasAyer", method: .get).responseJSON(){response in
                    print("\(response.value as! [[String: Any]])")
                    for value in response.value as! [[String: Any]]{
                        self.ArrayDatosLoterias.append(Datos(name: value["name"] as! String, href: value["href"] as! String))
                    }
                }
            }
        
            Text("Chances")
                .bold()
            
            List(){
                ForEach(ArrayDatosChances, id:\.id){item in
                    NavigationLink(destination: MoreInfoView(href: item.href)){
                        HStack{
                            Text(item.name)
                        }
                    }
                }
            }.onAppear{
                self.ArrayDatosChances = [Datos]()
                AF.request("http://192.168.0.10:3000/loteriasChance", method: .get).responseJSON(){response in
                    print("\(response.value as! [[String: Any]])")
                    for value in response.value as! [[String: Any]]{
                        self.ArrayDatosChances.append(Datos(name: value["name"] as! String, href: value["href"] as! String))
                    }
                }
            }
        }
    }
}

struct TabAyerView_Previews: PreviewProvider {
    static var previews: some View {
        TabAyerView()
    }
}
