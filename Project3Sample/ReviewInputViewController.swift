//
//  ReviewInputViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewInputViewController: UIViewController {
    
    var service: ReviewService()?
    var bookID: Int = 0
    @IBOutlet weak var titleInput: UITextField!
    
    @IBOutlet weak var reviewerInput: UITextField!
    
    @IBOutlet weak var bodyInput: UITextView!
    
    
    
    @IBAction func returnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        
        let title = titleInput.text!
        let reviewer = reviewerInput.text!
        let body = bodyInput.text!
        
        let review = Review(id: nil, bookId: bookID, date: nil, reviewer: reviewer, title: title, body: body)
        
        service?.createReview(review: review, completion: {
            self.dismiss(animated: true, completion: nil)
        })
    }
}
