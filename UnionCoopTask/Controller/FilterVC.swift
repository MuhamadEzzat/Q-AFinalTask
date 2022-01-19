//
//  FilterVC.swift
//  UnionCoopTask
//
//  Created by Mohamed Ezzat on 13/01/2022.
//

import UIKit

class FilterVC: UIViewController {

    @IBOutlet weak var minTF: UITextField!
    @IBOutlet weak var tagTF: UITextField!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    var getfiltersdelegate : FilterDelegates?
    var currentdate = ""
    var lastdate    = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loader.stopAnimating()
        // Do any additional setup after loading the view.
    }
    
    func getFilters(){
        AppClient.getAnswers(activityindicator: loader, min: Int(self.minTF.text!), tagged: self.tagTF.text, fromdate: "1604209341", todate: "1604209341") { data, error in
            self.getfiltersdelegate?.getFilters(datasource: data)
        }
    }
    
    @IBAction func applyBtn(_ sender: Any) {
        getFilters()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
