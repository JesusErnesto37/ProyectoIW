//
//  ContentView.swift
//  ProyectoIW
//
//  Created by CCDM31 on 10/11/22.
//

import SwiftUI

struct ContentView: View {
    let coreDM: CDM
    var body: some View {

        NavigationView {
            VStack{
            
                ListCeldaView(cored: coreDM)
                
            //fin list
                Button(action:{// boton de crear usuarios
                }){
                    NavigationLink(destination: NUsuario(cdm: coreDM)){
                        HStack{
                            Image(systemName: "person.badge.plus")
                            Text("Crear nuevo usuario")
                        }.foregroundColor(.white).padding(12).background(.blue).cornerRadius(18)
                        
                        
                    }
                
                }
                Button(action:{// boton de crear usuarios
                }){
                    NavigationLink(destination: EUsuario(coreM: coreDM)){
                        HStack{
                            Image(systemName: "person.badge.plus")
                            Text("editar Usuarios")
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
        ContentView(coreDM: CDM())
    }
}
