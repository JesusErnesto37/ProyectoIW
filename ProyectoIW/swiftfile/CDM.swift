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
    
    
    
}
