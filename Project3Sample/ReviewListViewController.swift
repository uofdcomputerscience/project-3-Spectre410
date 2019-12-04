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
    
    var reviewList: [Review] = []
    
    
    @IBOutlet weak var reviewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTable.delegate = self
        reviewTable.dataSource = self
        DispatchQueue.main.async {
            self.service.fetchReviews {
                self.reviewList = self.service.reviews
                self.reviewTable.reloadData()
            }
        }
    }
    
    
}

extension ReviewListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedObject = reviewList[indexPath.item]
        let detail = storyboard?.instantiateViewController(withIdentifier: "ReviewDetailViewController") as! ReviewDetailViewController
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        
        detail.idLabel.text = String(selectedObject.bookId)
        detail.reviewerLabel.text = selectedObject.reviewer
        detail.dateLabel.text = formatter.string(from: selectedObject.date!)
        detail.titleLabel.text = selectedObject.title
        detail.textView.text = selectedObject.body
        
        
        
        
        
        navigationController?.pushViewController(detail, animated: true)
    }
}

extension ReviewListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reviewTable.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
        cell.reviewTitle.text = reviewList[indexPath.item].title
        cell.reviewer.text = reviewList[indexPath.item].reviewer
        return cell
    }
}
