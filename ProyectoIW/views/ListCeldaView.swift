//
//  ListCeldaView.swift
//  ProyectoIW
//
//  Created by CCDM31 on 16/11/22.
//

import SwiftUI

struct ListCeldaView: View {
    var body: some View {
        HStack{
            Text("Username")
                .foregroundColor(.white)
                .padding(50)
                .background(.gray)
                .font(.custom("Arial", size: 20))
                .clipShape(Circle())
            
            
        
        
        VStack(alignment: .leading){
            
            Text("nombre").font(.custom("Arial", size:24)).foregroundColor(.blue)
        Text("apellido").font(.custom("Arial", size:20)).foregroundColor(.blue)
        Text("username").font(.custom("Arial", size:14)).foregroundColor(.blue)
            
        }//cierra vstack
        }//cierra hstack
        
    }
}

struct ListCeldaView_Previews: PreviewProvider {
    static var previews: some View {
        ListCeldaView()
    }
}
