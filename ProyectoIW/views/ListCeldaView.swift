//
//  ListCeldaView.swift
//  ProyectoIW
//
//  Created by CCDM31 on 16/11/22.
//

import SwiftUI

struct ListCeldaView: View {
    var body: some View {
        VStack(alignment: .leading){
            
            Text("nombre").font(.custom("Arial", size:30)).foregroundColor(.blue).padding(14)
        Text("apellido").font(.custom("Arial", size:30)).foregroundColor(.blue).padding(14)
        Text("username").font(.custom("Arial", size:30)).foregroundColor(.blue).padding(14)
        Text("rolid").font(.custom("Arial", size:30)).foregroundColor(.blue).padding(14)
            
        }
        
    }
}

struct ListCeldaView_Previews: PreviewProvider {
    static var previews: some View {
        ListCeldaView()
    }
}
