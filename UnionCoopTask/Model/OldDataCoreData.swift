//
//  OldDataCoreData.swift
//  UnionCoopTask
//
//  Created by Mohamed Ezzat on 13/01/2022.
//


import UIKit
import CoreData

class OldDataCoreData: NSObject {
    class func addData(title:String){
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            
            let myItem = NSEntityDescription.insertNewObject(forEntityName: "OldData", into: managedObjectContext) as! OldData
            
            myItem.title  = title
            
            do {
                try managedObjectContext.save()
                
            } catch { // Replace this implementation with code to handle the error appropriately. // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }//end of check for managed object
    }
    
    class func getData()->([OldData], String){
        var DataArr:[OldData] = []
        
        var title  = ""
       
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "OldData")
            
            // Add Sort Descriptor
            
            let sortDescriptorTitle = NSSortDescriptor(key: "title", ascending: true)
            fetchRequest.sortDescriptors = [sortDescriptorTitle]
            
            
            
            do {
                DataArr = try managedObjectContext.fetch(OldData.fetchRequest()) as! [OldData]
                for i in DataArr{
                    title    = i.title!
                    
                }
            } catch {
                //print("Failed to retrieve record")
                //print(error)
            }
        }
        return (DataArr, title)
    }
    
    class func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    class func deleteData(){ // Load menu items from database
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let mydata = NSFetchRequest<NSFetchRequestResult>(entityName: "OldData")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: mydata)
            
            do {
                try managedObjectContext.execute(deleteRequest)
            } catch {
                let saveError = error as NSError
                print(saveError)
            }
        }
    }
}

