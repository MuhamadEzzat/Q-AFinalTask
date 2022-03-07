//
//  ViewController.swift
//  UnionCoopTask
//
//  Created by Mohamed Ezzat on 13/01/2022.
//

import UIKit
import CoreData

class StackoverflowListVC: UIViewController, FilterDelegates {

    @IBOutlet weak var tbl: UITableView!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var datasource : _Data?
    var currentdate = ""
    var lastdate = ""
    
    var datacontroller : DataController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loader.stopAnimating()
        buttonShaping()
        getcurrenttime()
        // Do any additional setup after loading the view.
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }

    func getFilters(datasource: _Data) {
        DispatchQueue.main.async {
            self.datasource = datasource
            self.tbl.reloadData()
        }
    }
    
    func getData(){
        // Call API for the first time
        AppClient.getAnswers(activityindicator: loader, min: 0, tagged: "", fromdate: "1601617341", todate: "1604209341") { data, error in
            self.datasource = data
            DispatchQueue.main.async {
                self.tbl.reloadData()
            }
        }
    }
    @IBAction func filterBtn(_ sender: Any) {
        let nextStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = nextStoryboard.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        
        vc.getfiltersdelegate = self
        vc.lastdate = self.lastdate
        vc.currentdate = self.currentdate
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openSaved(_ sender: Any) {
        let nextStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = nextStoryboard.instantiateViewController(withIdentifier: "SavedVC") as! SavedVC
        vc.datacontroller = datacontroller
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

