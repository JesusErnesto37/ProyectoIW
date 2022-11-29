//
//  EUsuario.swift
//  ProyectoIW
//
//  Created by CCDM31 on 29/11/22.
//

import SwiftUI

struct EUsuario: View {
    let coreM: CDM
    @State var nombre = ""
    @State var apellido = ""
    @State var username = ""
    @State var seleccionado:Usuarios?
    @State var UserArrays = [Usuarios]()
  
    var body: some View {

        NavigationView {
            VStack{
            
                List{
                    ForEach(UserArrays, id: \.self){
                        user in
                        HStack{
                   
                        VStack(alignment: .leading){
                            
                        Text(user.nombre ?? "").font(.custom("Arial", size:24)).foregroundColor(.blue)
                        Text(user.apellido ?? "").font(.custom("Arial", size:20)).foregroundColor(.blue)
                        Text(user.username ?? "").font(.custom("Arial", size:14)).foregroundColor(.blue)
                            
                        }//cierra vstack
                        .onTapGesture{
                            seleccionado = user
                            nombre = user.nombre ?? ""
                            apellido = user.apellido ?? ""
                            username = user.username ?? ""
                        }
                            
                        }//cierra hstack
                        
                    }
                    
                    
                    .onDelete(perform:{
                        indexSet in
                        indexSet.forEach({ index in
                            let usuario = UserArrays[index]
                            coreM.borrarU(usuario: usuario)
                            mostrarUsuario()
                            
                            
                        })
                        
                    })
                    Spacer()
                     
               
                }
                VStack{
                    Text("Editar Usuario").font(.title.bold())
                    Spacer()
                    

                    TextField("Nombre: ", text: $nombre)
                        .font(.custom("Arial", size: 20)).padding(2)
                    TextField("Apellido: ", text: $apellido)
                        .font(.custom("Arial", size: 20)).padding(2)
                    TextField("Username: ", text: $username)
                        .font(.custom("Arial", size: 20)).padding(2)
                        .keyboardType(.phonePad)
                    
                    
                    Spacer()
                    Button("Guardar"){
                        if(seleccionado != nil){
                            
                            seleccionado?.nombre = nombre
                            seleccionado?.apellido = apellido
                            seleccionado?.username = username
                            coreM.actualizarU(usuario: seleccionado!)
                        }else{  coreM.guardarU(nombre: nombre, apellido: apellido, username: username)}
                      
                        nombre = ""
                        apellido = ""
                        username = ""
                        seleccionado = nil
                        
                    }.foregroundColor(.white).padding(12).background(.blue).cornerRadius(18)
                  
                  
                    
                    
                    
                }// cierra vstack
            //fin list
              
            }//fin vstack
          
            }//fin navigation
    }
    func mostrarUsuario(){
        UserArrays = coreM.leerTU()
    }
}

struct EUsuario_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDM: CDM())
    }
}
