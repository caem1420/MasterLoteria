//
//  MoreInfoView.swift
//  MasterLoteria
//
//  Created by Carlos Escobar on 8/01/21.
//

import SwiftUI
import Alamofire


struct MoreInfoView: View {
    @State var href: String
    @State var name: String = ""
    @State var resultado: String = ""
    @State var fecha: String = ""
    @State var seco: String = ""
    @State var extra: String = ""
    var body: some View {
        VStack{
            Text("Resultado")
                .font(.custom("Verdana-Bold" , size: 20))
                .padding(.leading, 1)
            
            Text("\(self.name)")
                .font(.custom("Verdana-Bold" , size: 20))
                .padding(.leading, 1)
            Text("\(self.fecha)")
            Text("\(self.resultado)")
                .font(.custom("Verdana-Bold" , size: 20))
                .padding(.leading, 1)
                .onAppear{
                AF.request("http://192.168.0.10:3000/getResultado", method: .get, parameters: ["link": self.href]).responseJSON(){response in
                    print(response.value as! [String: Any])
                    for item in (response.value as! [String: Any])["resultado"] as! [String]{
                        self.resultado += item
                    }
                    self.name = (response.value as! [String: Any])["name"] as! String
                    self.fecha = (response.value as! [String: Any])["date"] as! String
                    if((response.value as! [String: Any])["seco"] != nil){
                        for item in (response.value as! [String: Any])["seco"] as! [String]{
                            self.seco += item
                        }
                    }
                    if((response.value as! [String: Any])["extra"] != nil){
                        self.extra = (response.value as! [String: Any])["extra"] as! String
                    }
                }
            }
            if(self.seco != ""){
                Text("Seco: \(self.seco)")
                    .font(.custom("Verdana-Bold" , size: 20))
                    .padding(.leading, 1)
            }
            if(self.extra != ""){
                Text("\(self.extra)")
                    .font(.custom("Verdana-Bold" , size: 20))
                    .padding(.leading, 1)
            }
        }
    }
}

struct MoreInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoView(href: "")
    }
}
