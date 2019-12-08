//
//  ReviewDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewDetailViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var reviewerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var ID: String?
    var reviewee: String?
    var reviewTitle: String?
    var bodyText: String?
    var date: String?
    
    override func viewDidLoad() {
        idLabel.text = ID
        reviewerLabel.text = reviewee
        titleLabel.text = reviewTitle
        textView.text = bodyText
        dateLabel.text = date
        
        super.viewDidLoad()
    }
}
