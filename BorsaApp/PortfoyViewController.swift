//
//  PortfoyViewController.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 21.09.2023.
//

import UIKit


class PortfoyViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    

}
