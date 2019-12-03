//
//  BookListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {
    @IBOutlet weak var bookTableView: UITableView!
    let service = BookService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchBooks {
            <#code#>
        }
        bookTableView.dataSource = self
        bookTableView.delegate = self
    }
    
    
    
    
}

extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        
        return cell
    }
}

extension BookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedObject = service.books[indexPath.item]
        let detail = storyboard?.instantiateViewController(withIdentifier: "BookDetailViewController") as! BookDetailViewController
        // detail.titleLabel.text = selectedObject.name
        //  service.getImage(for: selectedObject.imageURL) { (url, image) in
        //   DispatchQueue.main.async {
        //  detail.largeImage = image
        //  }
        // }
        //detail.initialTitle = selectedObject.name
        //detail.initialURL = selectedObject.imageURL
        //detail.service = service
        
        navigationController?.pushViewController(detail, animated: true)
    }
}
