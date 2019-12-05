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
    
    var bookList: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchBooks {
            DispatchQueue.main.async {
                self.bookList = self.service.books
                self.bookTableView.reloadData()
            }
        }
        bookTableView.dataSource = self
        bookTableView.delegate = self
    }
    
    @IBAction func bookInputTapped(_ sender: Any) {
        let input = storyboard?.instantiateViewController(withIdentifier: "BookInputViewController") as! BookInputViewController
        input.service = service
        navigationController?.pushViewController(input, animated: true)
    }
    
    @IBAction func refreshTapped(_ sender: Any) {
        service.fetchBooks {
            DispatchQueue.main.async {
                self.bookList = self.service.books
                self.bookTableView.reloadData()
            }
        }
    }
    
    
}

extension BookListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        let selectedObject = bookList[indexPath.item]
        cell.titleLabel.text = selectedObject.title
        cell.authorLabel.text = selectedObject.author
        DispatchQueue.main.async {
            self.service.image(for: selectedObject, completion: { (book, image) in
                cell.bookImage.image = image
            })
        }
        return cell
    }
}

extension BookListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedObject = self.bookList[indexPath.item]
        let detail = storyboard?.instantiateViewController(withIdentifier: "BookDetailViewController") as! BookDetailViewController
        detail.bookID = selectedObject.id
        navigationController?.pushViewController(detail, animated: true)
    }
}
