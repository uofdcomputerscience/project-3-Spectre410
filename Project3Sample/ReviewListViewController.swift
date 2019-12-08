//
//  ReviewListViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class ReviewListViewController: UIViewController {
    
    var service = ReviewService()
    
    
    
    @IBOutlet weak var reviewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTable.delegate = self
        reviewTable.dataSource = self
        
        self.service.fetchReviews {
            DispatchQueue.main.async {
                self.reviewTable.reloadData()
            }
            
        }
    }
}
    
    


extension ReviewListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedObject = service.reviews[indexPath.item]
        let detail = storyboard?.instantiateViewController(withIdentifier: "ReviewDetailViewController") as! ReviewDetailViewController
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        
        detail.ID = String(selectedObject.bookId)
        detail.reviewee = selectedObject.reviewer
        if let a = selectedObject.date {
            detail.date = formatter.string(from: a)
        }
        detail.reviewTitle = selectedObject.title
        detail.bodyText = selectedObject.body
        
        
        
        
        
        navigationController?.pushViewController(detail, animated: true)
    }
}

extension ReviewListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTable.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
        let rev = service.reviews[indexPath.item]
        cell.reviewTitle.text = rev.title
        cell.reviewer.text = rev.reviewer
        return cell
    }
}
