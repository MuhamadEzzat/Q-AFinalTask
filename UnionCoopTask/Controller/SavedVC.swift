//
//  SavedVC.swift
//  UnionCoopTask
//
//  Created by Mohamed Ezzat on 07/03/2022.
//

import UIKit
import CoreData

class SavedVC: UITableViewController {
    
    var datacontroller : DataController!
    
    var olddata : [OldData] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest:NSFetchRequest<OldData> = OldData.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "user_id", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let result = try? datacontroller.viewContext.fetch(fetchRequest){
            olddata = result
            self.tableView.reloadData()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.olddata.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedcell", for: indexPath)
        cell.textLabel?.text = olddata[indexPath.row].title
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete: deleteOldData(at: indexPath)
        default: () // Unsupported
        }
    }
    
    func deleteOldData(at indexPath: IndexPath){
        let olddataToDelete = olddatafunc(at: indexPath)
        datacontroller.viewContext.delete(olddataToDelete)
        try? datacontroller.viewContext.save()
        
        olddata.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        if numberOfolddata == 0 {
            setEditing(false, animated: true)
        }
        updateEditButtonState()
    }

    func updateEditButtonState() {
        navigationItem.rightBarButtonItem?.isEnabled = numberOfolddata > 0
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    var numberOfolddata: Int { return olddata.count }
    
    func olddatafunc(at indexPath: IndexPath) -> OldData {
        return olddata[indexPath.row]
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
