//
//  ListCeldaView.swift
//  ProyectoIW
//
//  Created by CCDM31 on 16/11/22.
//

import SwiftUI

struct ListCeldaView: View {
    let cored: CDM
    @State var nombre = ""
    @State var apellido = ""
    @State var username = ""
    @State var UserArray = [Usuarios]()
    @State var seleccionado:Usuarios?
    var body: some View {
        List{
            ForEach(UserArray, id: \.self){
                user in
                NavigationLink( destination:EUsuario(coreM: cored, nombre: $nombre, apellido: $apellido, username: $username, seleccionado: $seleccionado)){
                HStack{
                    
                VStack(alignment: .leading){
                    
                Text(user.nombre ?? "").font(.custom("Arial", size:24)).foregroundColor(.blue)
                Text(user.apellido ?? "").font(.custom("Arial", size:20)).foregroundColor(.blue)
                Text(user.username ?? "").font(.custom("Arial", size:14)).foregroundColor(.blue)
                    
                }//cierra vstack
           
                    
                }//cierra hstack
                   
                }     .onTapGesture{
                    seleccionado = user
                    nombre = user.nombre ?? ""
                    apellido = user.apellido ?? ""
                    username = user.username ?? ""
                    mostrarUsuario()
                }
            }
            
            
            .onDelete(perform:{
                indexSet in
                indexSet.forEach({ index in
                    let usuario = UserArray[index]
                    cored.borrarU(usuario: usuario)
                    mostrarUsuario()
                    
                    
                })
                
            })
            Spacer()
             
       
        }.padding().onAppear(perform: {
            mostrarUsuario()
        })
        
    }
    func mostrarUsuario(){
        UserArray = cored.leerTU()
    }
}



struct ListCeldaView_Previews: PreviewProvider {
    static var previews: some View {
        ListCeldaView(cored: CDM())
    }
}
