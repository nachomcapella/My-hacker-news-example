//
//  APIManager.swift
//  api_manager_json_example
//
//  Created by Mariano Martinez on 21/3/18.
//  Copyright © 2018 Nacho Martinez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    //let baseURL = "https://jsonplaceholder.typicode.com"
    let baseURL = "https://hn.algolia.com/api/v1/"
    static let sharedInstance = APIManager()
    //static let getPostsEndpoint = "/posts/"
static let getPostsEndpoint = "search_by_date?query=ios"
    
    func getPostWithId (postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL + APIManager.getPostsEndpoint + String(postId)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task =  session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                let result = try! JSON(data: data!)
                onSuccess(result)
            }
        })
        task.resume()
    }
    
    
    func getHackerNews(onSuccess: @escaping([HackerNews]) -> Void, onFailure: @escaping(Error) -> Void) {
        getPostWithId(postId: 1, onSuccess: { json in
            if let hackerNews = json["hits"].array {
                var hackerNewsItems: [HackerNews] = []
                for j in hackerNews{
                    let hackerNew = HackerNews.fromJSON(j)
                    hackerNewsItems.append(hackerNew)
                }
                DispatchQueue.main.async {
                    onSuccess(hackerNewsItems)
                }
            }
           
        }, onFailure: { error in
            onFailure(error)
            /*
            */
        })
    }
}





