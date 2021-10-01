//
//  TableViewController.swift
//  ObjCReddit
//
//  Created by Jeremy Warren on 10/1/21.
//

import UIKit


class TableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
          posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)

        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = "upvotes: \(post.upvotes) comments: \(post.comments)"
        
        return cell
    }
}


extension TableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let subreddit = searchBar.text ?? ""
        PostManager.fetchSubreddit(withName: subreddit) { posts in
            self.posts = posts
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
}
