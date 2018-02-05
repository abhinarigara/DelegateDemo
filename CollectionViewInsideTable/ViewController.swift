//
//  ViewController.swift
//  CollectionViewInsideTable
//
//  Created by Abhi's Mac on 23/01/18.
//  Copyright © 2018 Abhi's Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    
    var setColor = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblView.dataSource = self
        self.tblView.delegate = self
        self.setColor = UIColor.gray
    }

}

extension ViewController : ChangeColor {
    func getColor(_ color: UIColor) { 
        
        self.setColor = color
        self.tblView.reloadData()
    }
    
}

extension ViewController : UITableViewDataSource,UITableViewDelegate
{

    //MARK:-UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var mainCell = UITableViewCell()
        mainCell.selectionStyle = .none
        if indexPath.row == 0{
            let cell = self.tblView.dequeueReusableCell(withIdentifier: "ImageCell") as! ImageCell
            cell.viewColor.backgroundColor = self.setColor
            
            mainCell = cell
        }else{
            let cell = self.tblView.dequeueReusableCell(withIdentifier: "CollectionCell") as! CollectionCell
            cell.colorDelegate = self
            mainCell = cell
        }
        return mainCell
    }
    //MARK:- UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 50
        }else{
            return 70
        }
    }
}
