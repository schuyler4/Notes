//
//  dataController.swift
//  notes2
//
//  Created by Marek Newton on 1/26/17.
//  Copyright © 2017 Marek Newton. All rights reserved.
//

import CoreData
import UIKit

public func getContext () -> NSManagedObjectContext {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
}

public func getTranscriptions () -> Array<Note> {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return []
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
    
    do {
        return try managedContext.fetch(fetchRequest) as! [Note]
    } catch _ as NSError {
        return []
    }
    
}

public func storeContent(content: String) {
    let context = getContext()
    
    let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
    let addData = NSManagedObject(entity: entity!, insertInto: context)
    
    addData.setValue(content, forKey: "content")
    
    do {
        try context.save()
    } catch let error as NSError {
        print("Could not save \(error)")
    }
}

public func updateDone(done: Bool, note: Note) {
    let context = getContext()

    note.setValue(done, forKey: "done")
    
    do {
        try context.save()
        print("added data")
    } catch let error as NSError {
        print("Could not save \(error)")
    }
}

public func panda() -> Bool {
    return true
}

