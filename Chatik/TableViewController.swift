//
//  TableViewController.swift
//  Chatik
//
//  Created by Hiii Power on 20.02.19.
//  Copyright © 2019 Hiii Power. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController {

}
extension TableViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.configure(title: ":jgf", subtitle: "\(indexPath)")
        return cell
    }
}
extension TableViewController: UITableViewDelegate{
    
}

class MyCell: UITableViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    
    func configure(title: String, subtitle: String){
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
    
}
