//
//  LoadDataViewController.swift
//  JsonSerialization
//  Created by Sejal on 09/02/23.


import UIKit

class LoadDataViewController: UIViewController {
    
    var comments = [Comments]()

    var commentProtocolReference :CommentsDataProtocol?

    override func viewDidLoad() {
    super.viewDidLoad()
     
        
    }


    @IBAction func LoadButton(_ sender: Any) {
        
        fetchApi()
    }
    
    func fetchApi(){
        
        let urlString="https://jsonplaceholder.typicode.com/comments"
        let url = URL(string: urlString)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        var session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            var getJSONObject = try! JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
            
            
            for dictionary in getJSONObject{
                
                // let postid = dictionary["postid"] as! Int
                let commentid = dictionary["id"] as! Int
                let commentName = dictionary["name"] as! String
                let email = dictionary["email"] as! String
                let commentbody = dictionary["body"] as! String
                
                let newCommentObject = Comments(id: commentid, name: commentName, email: email, body: commentbody)
                
                self.comments.append(newCommentObject)
                self.commentProtocolReference?.passData(comments: self.comments)
                DispatchQueue.main.async {
                    // running on main thread
                    self.navigationController?.popViewController(animated: true)
                }

            }
            
        }
    
        dataTask.resume()
    }
    
}

