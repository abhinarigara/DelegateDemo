//
//  CollectionCell.swift
//  CollectionViewInsideTable
//
//  Created by Abhi's Mac on 23/01/18.
//  Copyright © 2018 Abhi's Mac. All rights reserved.
//

import UIKit

protocol ChangeColor {
    func getColor(_ color: UIColor)
}

class CollectionCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var colorDelegate : ChangeColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
    //MARK:- UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionColorCell", for: indexPath) as! CollectionColorCell
        
        let color = getRandomColor()
        cell.backgroundColor = color
        
        return cell
    }
    //MARK:- UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let currentCell = self.collectionView.cellForItem(at: indexPath)
        let color = currentCell?.backgroundColor
        
        colorDelegate?.getColor(color!)
    }
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
class CollectionColorCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
