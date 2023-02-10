//
//  CommentsViewController.swift
//  JsonSerialization
//
//  Created by Sejal on 09/02/23.
//

import UIKit

class DisplayDataTableViewController: UIViewController {
    
    @IBOutlet weak var DisplayTableView: UITableView!
    var arrayOfComments = [Comments]()

    override func viewDidLoad() {
        
        let nib = UINib(nibName: "commentsCell", bundle: nil)
        DisplayTableView.register(nib, forCellReuseIdentifier: "commentsCell")
        
        DisplayTableView.delegate = self
        DisplayTableView.dataSource = self
    }
    @IBAction func NavigateToLoad(_ sender: Any) {
        
        let NavigateToLoad = (self.storyboard?.instantiateViewController(withIdentifier: "LoadDataViewController") as? LoadDataViewController)!
        NavigateToLoad.commentProtocolReference = self
          navigationController?.pushViewController(NavigateToLoad, animated: true)
        
    }
}
extension DisplayDataTableViewController:CommentsDataProtocol {
    func passData(comments: [Comments]) {
        arrayOfComments = comments
        DisplayTableView.reloadData()
    }
    
    
}
extension DisplayDataTableViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfComments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath) as! commentsCell? else { return UITableViewCell () }
        let commentItem = arrayOfComments[indexPath.row]
        cell.IdLabel.text = "Id: \(commentItem.id)"
        cell.NameLabel.text = "Name: \(commentItem.name)"
        cell.EmailLabel.text = commentItem.email
        cell.BodyLabel.text = commentItem.body
        return cell
    }
}
        
        




