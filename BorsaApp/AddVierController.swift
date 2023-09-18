//
//  AddVierController.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 7.09.2023.
//

import UIKit
import SwiftSoup
class AddVierController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    var gelenSymbols: Array<String> = []
    var gelenFiyatlar: Array<String> = []
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gelenSymbols.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = (String(gelenSymbols[indexPath.row]) + "\t\t / \t\t" + String(gelenFiyatlar[indexPath.row]) )
        
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(gelenSymbols[indexPath.row])
    }
    

}
