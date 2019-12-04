//
//  BookDetailViewController.swift
//  Project3Sample
//
//  Created by Russell Mirabelli on 11/16/19.
//  Copyright © 2019 Russell Mirabelli. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var largeImage: UIImageView!
    
    var service: ReviewService()
    var bookID: Int?
    var reviewList: [Review] = []
    
    @IBOutlet weak var bookTitle: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var publishedLabel: UILabel!
    
    @IBOutlet weak var reviewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTable.delegate = self
        reviewTable.dataSource = self
        DispatchQueue.main.async {
            service.fetchReviews(completion: nil)
            self.reviewTable.reloadData()
        }
        for rev in service.reviews {
            if rev.id == bookID {
                reviewList.append(rev)
            }
        }
    }
    @IBAction func returnTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func reviewTapped(_ sender: Any) {
        let inputReview = storyboard?.instantiateViewController(withIdentifier: "ReviewInputViewController")
        inputReview.service = service
        navigationController?.pushViewController(inputReview, animated: true)
        
    }
    
}

extension BookDetailViewController: UITableViewDelegate {
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

extension BookDetailViewController: UITableViewDataSource {
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
