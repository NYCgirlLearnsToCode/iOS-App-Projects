//
//  ReviewCellViewController.swift
//  NYTMovieReviews
//
//  Created by Lisa J on 12/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ReviewCellViewController: UIViewController {
    var selectedcritic: CriticInfo! {
        didSet {
            loadData()
        }
    }
    
    var reviews = [ReviewResultInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }
    
    func loadData() {
        let criticName = selectedcritic.display_name
        let myKey = "d25bbcfec3b1417b814cb3e5dab750a4"
        let url = "https://api.nytimes.com/svc/movies/v2/reviews/search.json?reviewer=\(criticName)&api-key=\(myKey)"
        let setReviews: ([ReviewResultInfo]) -> Void = {(onlineReview: [ReviewResultInfo]) in
            self.reviews = onlineReview
        }
        ReviewAPIClient.manager.getReviews(from: url, completionHandler: setReviews, errorHandler: {print($0)})
    }
    
}
extension ReviewCellViewController: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let review = reviews[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Review cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
}

