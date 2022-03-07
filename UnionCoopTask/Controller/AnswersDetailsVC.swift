//
//  AnswersDetailsVC.swift
//  UnionCoopTask
//
//  Created by Mohamed Ezzat on 27/02/2022.
//

import UIKit
import CoreData

class AnswersDetailsVC: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var ownerTitle: UILabel!
    @IBOutlet weak var reachLbl: UILabel!
    @IBOutlet weak var answersLbl: UILabel!
    @IBOutlet weak var isanswered: UILabel!
    @IBOutlet weak var linkBtn: UIButton!
    
    var datasource : Items!
    
    var datacontroller: DataController!
    
    var olddata :OldData!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.linkBtn.addTarget(self, action: #selector(openLink), for: .touchUpInside)
        setDefault()
        // Do any additional setup after loading the view.
    }
    
    @objc func openLink(){
        if let url = URL(string: datasource.link) {
            UIApplication.shared.open(url)
        }
    }
    
    func setDefault(){
        downloadImg()
        
        ownerTitle.text = datasource.owner.display_name
        if datasource.is_answered == true{
            self.isanswered.text = "Answered"
            self.isanswered.textColor = UIColor.green
            
        }else{
            self.isanswered.text = "Not Answered!"
            self.isanswered.textColor = UIColor.red
        }
        self.answersLbl.text = "Number of answers : \(datasource.answer_count)"
        self.reachLbl.text = "Number of Views : \(datasource.view_count)"
        self.linkBtn.setTitle(datasource.link, for: .normal)
        
    }
    
    func downloadImg(){
        
        if let imageurl = URL(string: datasource.owner.profile_image){
            let task = URLSession.shared.dataTask(with: imageurl) { data, response, error in
                guard let data = data else{
                    return
            }
                DispatchQueue.main.async {
                    if let img = UIImage(data: data){
                        self.img.image = img
                    }else{
                        self.img.image = UIImage(named: "2111628")
                    }
                }
            }
            task.resume()
        }
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        let oldata = OldData(context: datacontroller.viewContext)
        
        oldata.profile_image = datasource.owner.profile_image
        oldata.link = datasource.link
        oldata.view_count = Int64(datasource.view_count)
        oldata.answer_count = Int64(datasource.answer_count)
        oldata.is_answered = datasource.is_answered
        oldata.title = datasource.title
        oldata.display_name = datasource.owner.display_name
        oldata.profile_link = datasource.owner.link
        oldata.user_id = Int64(datasource.owner.user_id)
//        olddata.score = Int64(datasource.score)
        
        try? datacontroller.viewContext.save()
        
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
