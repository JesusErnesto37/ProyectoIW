//
//  CDM.swift
//  ProyectoIW
//
//  Created by CCDM31 on 23/11/22.
//

import Foundation
import CoreData

class CDM {
    
    let persistentContainer : NSPersistentContainer
    
    init(){
        persistentContainer = NSPersistentContainer(name: "Usuarios")
        persistentContainer.loadPersistentStores(completionHandler: {
            (descripcion, error) in
            if let error = error {
                fatalError("Core data failed to initizliazee \(error.localizedDescription)")
            }
        })
    }
        func guardarU(id: Int32, nombre: String, apellido: String, username: String, rolid:Int32){
            let usuario = Usuarios(context: persistentContainer.viewContext)
            usuario.id = id
            usuario.nombre = nombre
            usuario.apellido = apellido
            usuario.username = username
            usuario.rolid = rolid
            
            do{
                try persistentContainer.viewContext.save()
                print("Usuario guardado")
            }
            catch{
                print("fallo en guardar \(error) ")
            }
            
    }
    
    func leerTU() -> [Usuarios]{
        let fetchRequest : NSFetchRequest<Usuarios> = Usuarios.fetchRequest()
        
        do{
            return try persistentContainer.viewContext.fetch(fetchRequest)
        }
        catch{return[]}
    }
    
    func borrarU(usuario: Usuarios){
        persistentContainer.viewContext.delete(usuario)
        
        do{
            try persistentContainer.viewContext.save()
        }catch{
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error.localizedDescription)")
        }
        
        
        
        
        
        
    }
    
    
}
