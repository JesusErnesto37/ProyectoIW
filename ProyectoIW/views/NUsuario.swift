//
//  NUsuario.swift
//  ProyectoIW
//
//  Created by CCDM31 on 17/11/22.
//

import SwiftUI

struct NUsuario: View {
    let cdm: CDM
    @State var id = ""
    @State var nombre = ""
    @State var apellido = ""
    @State var username = ""
    @State var rolid = ""
    
   
    
    var body: some View {
        VStack{
            Text("Nuevo Usuario").font(.title.bold())
            Spacer()
            
            TextField("ID: ", text: $id)
                .font(.custom("Arial", size: 20)).padding(2)
            TextField("Nombre: ", text: $nombre)
                .font(.custom("Arial", size: 20)).padding(2)
            TextField("Apellido: ", text: $apellido)
                .font(.custom("Arial", size: 20)).padding(2)
            TextField("Username: ", text: $username)
                .font(.custom("Arial", size: 20)).padding(2)
            TextField("Rol: ", text: $rolid)
                .font(.custom("Arial", size: 20)).padding(2)
                .keyboardType(.phonePad)
            
            
            Spacer()
            Button("Guardar"){
                
                cdm.guardarU(id: id, nombre: nombre, apellido: apellido, username: username, rolid: rolid)
                
                
            }.foregroundColor(.white).padding(12).background(.blue).cornerRadius(18)
          
          
            
            
            
        }// cierra vstack
    }
}

struct NUsuario_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CDM())
    }
}

