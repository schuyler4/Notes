//
//  dataController.swift
//  notes2
//
//  Created by Marek Newton on 1/26/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import CoreData
import UIKit

class DataController: NSObject {
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    func getTranscriptions () -> Array<Note> {
        //create a fetch request, telling it about the entity
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        
        do {
            let result = try getContext().fetch(request)
            return result as! Array<Note>
        }
        catch let error {
            print(error.localizedDescription)
            return []
        }
    }

}
