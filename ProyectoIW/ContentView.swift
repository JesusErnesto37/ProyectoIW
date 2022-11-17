//
//  ContentView.swift
//  ProyectoIW
//
//  Created by CCDM31 on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            VStack{
            List{
                ListCeldaView()
                
            }//fin list
                Button(action:{// boton de crear usuarios
                }){
                    NavigationLink(destination: NUsuario()){
                        HStack{
                            Image(systemName: "person.badge.plus")
                            Text("Crear nuevo usuario")
                        }.foregroundColor(.white).padding(12).background(.blue).cornerRadius(18)
                        
                        
                    }
                
                }
            }//fin vstack
            .navigationTitle("Usuarios")
            }//fin navigation
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
