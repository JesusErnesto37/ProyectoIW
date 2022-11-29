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
        func guardarU(id: String, nombre: String, apellido: String, username: String, rolid:String){
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
    
    func guardarU(nombre: String, apellido: String, username: String){
        let usuario = Usuarios(context: persistentContainer.viewContext)
      
        usuario.nombre = nombre
        usuario.apellido = apellido
        usuario.username = username
        
        
        do{
            try persistentContainer.viewContext.save()
            print("Usuario guardado")
        }
        catch{
            print("fallo en guardar \(error) ")
        }
        
}
    
    func leerUnu(nombre:String) -> Usuarios?{
        let fetchRequest : NSFetchRequest<Usuarios> = Usuarios.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", nombre)
        fetchRequest.predicate = predicate
        
        do{
            let datos = try persistentContainer.viewContext.fetch(fetchRequest)
            return datos.first
        }catch{
            persistentContainer.viewContext.rollback()
            print("Failed to save context \(error.localizedDescription)")
        }
        return nil
    }
    
    func actualizarU(usuario: Usuarios){
        let fetchRequest : NSFetchRequest<Usuarios> = Usuarios.fetchRequest()
        let predicate = NSPredicate(format: "id = %@", usuario.nombre ?? "")
        fetchRequest.predicate = predicate
        
        //var user = persistentContainer.viewContext.updatedObjects([usuario])
        
        do{
            let datos = try persistentContainer.viewContext.fetch(fetchRequest)
            let u = datos.first
            u?.nombre = usuario.nombre
            u?.apellido = usuario.apellido
            u?.username = usuario.username
            try persistentContainer.viewContext.save()
            print("Usuario actualizado")
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
