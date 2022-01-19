//
//  AppClient.swift
//  UnionCoopTask
//
//  Created by Mohamed Ezzat on 13/01/2022.
//

import Foundation
import UIKit

class AppClient{
    
    class func getAnswers(activityindicator: UIActivityIndicatorView, min: Int?, tagged: String?, fromdate: String, todate: String, completion: @escaping (_Data, Error?) -> Void){
        var url = URLComponents()

        
        url.scheme = "https"
        url.host   = "api.stackexchange.com"
        url.path   = "/2.2/questions/no-answers"
        url.queryItems = [URLQueryItem(name: "min", value: "\(String(describing: min ?? 0))"),
                          URLQueryItem(name: "tagged", value: tagged),
                          URLQueryItem(name: "fromdate", value: fromdate),
                          URLQueryItem(name: "todate", value: todate),
                          URLQueryItem(name: "order", value: "asc"),
                          URLQueryItem(name: "sort", value: "votes"),
                          URLQueryItem(name: "site", value: "stackoverflow")]
        print(url.url, "sdsd")
        var request = URLRequest(url: url.url!)
        request.httpMethod = "GET"
        request.addValue("stackexchange", forHTTPHeaderField: "Username")
        request.addValue("admin@123456", forHTTPHeaderField: "Password")
        request.addValue("en", forHTTPHeaderField: "Lang")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("IOS", forHTTPHeaderField: "DeviceType")
        // encoding a JSON body from a string, can also use a Codable struct
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
          if error != nil { // Handle error…
              return
          }
            print(String(data: data!, encoding: .utf8)!)
            do{
                let decoder = JSONDecoder()
                let model = try decoder.decode(_Data.self, from: data!)
                completion(model, nil)
                print(model.items, "DDSDS")
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

}
