//
//  PortfoyViewController.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 21.09.2023.
//

import UIKit


class PortfoyViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var lblToplam: UILabel!
    
    
    var portfoyHisse    : Array<String> = []
    var portfoyAdet     : Array<String> = []
    var portfoyMaliyet  : Array<String> = []
    var portfoyFiyat    : Array<String> = []

    var tumHisseler     : Array<String> = []
    var tumFiyatlar     : Array<String> = []
    
    var bulunanFiyart   : Array<String> = []
    
    var denemeliste     = [Array<String> : Array<String>]()
    
    var hisseIndexler = [Int]()
    var hisseFiyatlar = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        portfoyHisse = []
//        portfoyAdet = []
//        portfoyMaliyet = []
//        portfoyFiyat = []
        
        lblToplam.text = "Toplam : \(hisseFiyatlar.count)"
        
        denemeliste = [tumHisseler : tumFiyatlar]
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        print(portfoyHisse)


        for hisse in portfoyHisse{
            self.hisseIndexler.append(tumHisseler.firstIndex(of: hisse) ?? 111)
        }
        for i in hisseIndexler{
            self.hisseFiyatlar.append(tumFiyatlar[i])
        }
//        print("removingDuplicates.Count : \(duplicates.count)")
//        print(hisseFiyatlar)
//        print(hisseIndexler)
        var toplam = 0
//        for i in hisseFiyatlar{
//            
//        }
        lblToplam.text = "Toplam : \(toplam)"

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return portfoyHisse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "portfoyCell") as! PortfoyTableViewCell
        cell.lblHisse.text = portfoyHisse[indexPath.row]
        cell.lblAdet.text = portfoyAdet[indexPath.row]
//        cell.lblMaliyet.text = portfoyMaliyet[indexPath.row]
        for hisse in portfoyHisse{
            self.hisseIndexler.append(tumHisseler.firstIndex(of: hisse) ?? 111)
        }
        for i in hisseIndexler{
            self.hisseFiyatlar.append(tumFiyatlar[i])
        }
        cell.lblMaliyet.text = hisseFiyatlar[indexPath.row]
        cell.lblGuncelTutar.text = "Guncel Tutar"
        

//        cell.lblGuncelFiyat.text = portfoyMaliyet[indexPath.row]
        
        return cell
    }
    

}
