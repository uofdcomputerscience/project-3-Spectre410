//
//  BookInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookInputViewController: UIViewController {
    
    var service: BookService()?
    
    @IBOutlet weak var bookTitleInput: UITextField!
    
    @IBOutlet weak var authorInput: UITextField!
    
    @IBOutlet weak var datePublishedInput: UITextField!
    
    @IBOutlet weak var imageURLInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func returnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        
        let title = bookTitleInput.text
        let author = authorInput.text
        let date = datePublishedInput.text
        let url = imageURLInput.text
        
        let book = Book(id: nil, title: title!, author: author!, published: date!, imageURLString: url!)
        
        service?.createBook(book: book, completion: {
            self.dismiss(animated: true, completion: nil)
        })
    }
    
}
