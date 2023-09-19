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
    var gelenDegisim: Array<String> = []
    
    var selectedSembol = " "
    var selectedFiyat = " "
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
//        let cell = UITableViewCell()
//        cell.textLabel?.text = (String(gelenSymbols[indexPath.row]) + "\t\t / \t\t" + String(gelenFiyatlar[indexPath.row]) )
        let cell = tableView.dequeueReusableCell(withIdentifier: "cello") as! MyTableCell
        cell.lblsym2.text = gelenSymbols[indexPath.row]
        cell.lblFiyat.text = gelenFiyatlar[indexPath.row]
        if gelenDegisim[indexPath.row].first == "-" {
            cell.lblDegisim.text = gelenDegisim[indexPath.row]
            cell.lblDegisim.textColor = UIColor.red
        }
        else{
            cell.lblDegisim.text = gelenDegisim[indexPath.row]
            cell.lblDegisim.textColor = UIColor.systemGreen
        }
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(gelenSymbols[indexPath.row] + " " + gelenFiyatlar[indexPath.row])
        
        selectedSembol = gelenSymbols[indexPath.row]
        selectedFiyat = gelenFiyatlar[indexPath.row]
        
        performSegue(withIdentifier: "toHisseEklemeVC", sender: nil)

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHisseEklemeVC"{
            let destinationVC = segue.destination as! HisseEklemeVC
            destinationVC.degisken1 = selectedSembol
            destinationVC.degisken2 = selectedFiyat
            
        }
    }

}
