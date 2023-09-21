//
//  ViewController.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 4.09.2023.
//

import UIKit
import SwiftSoup
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var btnHisseEkle: UIButton!
    
    @IBOutlet weak var lblUser: UILabel!
    
    var symbolList: Array<Substring> = []
    var liste1: Array<String> = []

    var semboller   : Array<String> = []
    var fiyatlar    : Array<String> = []
    var degisim     : Array<String> = []
    var tarih       : Array<String> = []
    
    var portfoyHisse    : Array<String> = []
    var portfoyAdet     : Array<String> = []
    var portfoyMaliyet  : Array<String> = []
    
    var myHtmlString = "boş myHtmlStr"
    var array_name = [String]()
    
    func firebasePortfoyuAl() {
        let firestoreDB = Firestore.firestore()
        firestoreDB.collection("portfoy").whereField("email", isEqualTo:lblUser.text!).addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription ?? "Hata mesaji")
            }
            else{
                if snapshot?.isEmpty != true && snapshot != nil {
                
                    for document in snapshot!.documents {
                        
                        if let hisse = document.get("hisse") as? String{
                            if let maliyet = document.get("maliyet") as? String{
                                if let adet = document.get("adet") as? String{
                                    self.portfoyHisse.append(hisse)
                                    self.portfoyMaliyet.append(maliyet)
                                    self.portfoyAdet.append(adet)
                                }
                            }
                        }
                        
                    }
                
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUser.text = Auth.auth().currentUser?.email
        let cls = DataClass()
        _ = cls.getDatas(erenHandler: { str, err in
            guard let str = str else {return "bos geldi"}
            cls.parser(html: str) { data, error in
                                
                self.symbolList.append(contentsOf: data!)
                    
            }
            do{
                let document : Document = try SwiftSoup.parse(str)
                guard let body = document.body() else { return ""}
                let zebras = try body.getElementsByClass("zebra").text()
                let firsthSplit = zebras.split(separator: " ")

                firsthSplit.map{
                    self.liste1.append(String($0))
                }
                let arr = self.liste1
                let filtered = arr.filter { $0 != " " }
                
                let filtered2 = filtered.filter { $0 != "  " }
                var index = 0
                for _ in filtered2{
                    if index >= filtered2.startIndex && index < filtered2.endIndex {
                        self.semboller.append(filtered2[index])
                        index = index + 1
                        self.fiyatlar.append(filtered2[index])
                        index = index + 1
                        self.degisim.append(filtered2[index])
                        index = index + 1
                        self.tarih.append(filtered2[index])
                        index = index + 1

                    }
                }
                
                print("semboller :" + String(self.semboller.count))
                print("fiyatlar :" + String(self.fiyatlar.count))
                print("degisim :" + String(self.degisim.count))
                print("tarih :" + String(self.tarih.count))
   

            }catch{
                
            }
            
            
            return str
        })
        
        

        
        
    }

    @IBAction func hisseEkleClicked(_ sender: Any) {
        performSegue(withIdentifier: "toAddVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddVC"{
            let destinationVC = segue.destination as! AddVierController
            destinationVC.gelenSymbols = semboller
            destinationVC.gelenFiyatlar = fiyatlar
            destinationVC.gelenDegisim = degisim
            
        }
    }
    
    @IBAction func portfoyClicked(_ sender: Any) {
        self.firebasePortfoyuAl()
    }
    
}

