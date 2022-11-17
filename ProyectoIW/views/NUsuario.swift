//
//  NUsuario.swift
//  ProyectoIW
//
//  Created by CCDM31 on 17/11/22.
//

import SwiftUI

struct NUsuario: View {
   
    @State private var nombre = ""
    @State private var apellido = ""
    @State private var username = ""
    
    @Environment(\.managedObjectContext) var conexionBase
    
    var body: some View {
        VStack{
            Text("Nuevo Usuario").font(.title.bold())
            Spacer()
            
        
            TextField("Nombre: ", text: self.$nombre)
                .font(.custom("Arial", size: 20)).padding(2)
            TextField("Apellido: ", text: self.$apellido)
                .font(.custom("Arial", size: 20)).padding(2)
            TextField("Username: ", text: self.$username)
                .font(.custom("Arial", size: 20)).padding(2)
                .keyboardType(.phonePad)
            
            Spacer()
            Button(action:{
                
                let nuevoDatoGrabar = informacionUsuariosbase(context: self.conexionBase)
                
                nuevoDatoGrabar.nombre = self.nombre
                nuevoDatoGrabar.apellido = self.nombre
                nuevoDatoGrabar.username = self.username
                
                do{
                    try self.conexionBase.save()
                    print("se guardo")
                } catch let verificarErroras as NSError {
                    print("Parece que hay un problema", verificarErroras.localizedDescription)
                }
                
                
                
            }){
                HStack{
                    Image(systemName: "person.badge.plus")
                    Text("Guardar nuevo usuario")
                }.foregroundColor(.white).padding(12).background(.blue).cornerRadius(18)
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }// cierra vstack
    }
}

struct NUsuario_Previews: PreviewProvider {
    static var previews: some View {
        NUsuario()
    }
}
