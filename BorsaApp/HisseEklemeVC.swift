//
//  HisseEklemeVC.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 19.09.2023.
//

import UIKit
import Firebase
class HisseEklemeVC: UIViewController {

    @IBOutlet weak var txtHisseKodu: UITextField!
    
    @IBOutlet weak var txtHisseAdet: UITextField!
    
    @IBOutlet weak var txtHisseMaliyet: UITextField!
    
    @IBOutlet weak var btnKaydet: UIButton!
    
    var degisken1 = ""
    var degisken2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtHisseKodu.text       = degisken1
        txtHisseMaliyet.text    = degisken2
        txtHisseKodu.isEnabled = false
        // Do any additional setup after loading the view.
    }
    

    func hataMesajiGoster(title : String , message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okBtn)
        self.present(alert, animated: true , completion: nil)
        
    }
    
    @IBAction func btnKaydetClicked(_ sender: Any) {
        if txtHisseAdet.text != "" && txtHisseMaliyet.text != "" {
        let firestore = Firestore.firestore()
        let firestorePost = [ "email" : Auth.auth().currentUser!.email ?? "hata" , "hisse" : degisken1 , "adet" : Int(txtHisseAdet.text!) ?? 0 , "maliyet" : Int(txtHisseMaliyet.text!) ?? 0] as [String : Any]
        
        firestore.collection("portfoy").addDocument(data: firestorePost) { error in
            if error != nil {
                self.hataMesajiGoster(title: "Hata", message: error?.localizedDescription ?? "kayit yapilamadi")
            }
            else{
                self.dismiss(animated: true)
            }
        }
        
        }
        else {
            hataMesajiGoster(title: "Eksik veri", message: "Tüm alanları doldurun")
        }
    }

}
