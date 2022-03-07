//
//  StackOverflowEx.swift
//  UnionCoopTask
//
//  Created by Mohamed Ezzat on 13/01/2022.
//

import Foundation
import UIKit

extension StackoverflowListVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if datasource?.items != nil {
            cell.textLabel?.text = self.datasource?.items[indexPath.row].title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = nextStoryboard.instantiateViewController(withIdentifier: "AnswersDetailsVC") as! AnswersDetailsVC
        
        vc.datasource = self.datasource?.items[indexPath.row]
        vc.datacontroller = datacontroller
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getcurrenttime(){
        let date = Date()
        let calendar = Calendar.current
        let currentdate = calendar.component(.nanosecond, from: date)
        
        
        self.currentdate = String(describing:currentdate)
        
    }
    
    func buttonShaping(){
        filterBtn.layer.cornerRadius = 25
        filterBtn.layer.borderColor = UIColor.black.cgColor
        filterBtn.layer.borderWidth = 1
    }
    
    
}
