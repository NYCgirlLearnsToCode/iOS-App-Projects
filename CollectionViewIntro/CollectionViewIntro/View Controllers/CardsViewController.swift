//
//  ViewController.swift
//  CollectionViewIntro
//
//  Created by Lisa J on 12/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cards = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        loadTestCards()
        
    }
    func loadTestCards() {
        self.cards = Card.fiveTestCards
    }
}
extension CardsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //TODO
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //TODO
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card cell", for: indexPath) as? CardCollectionViewCell else {
            //TODO: error handling
            return UICollectionViewCell()
        }
        let card = cards[indexPath.row]
        cell.nameLabel.text =  card.name
        return cell
    }
}
