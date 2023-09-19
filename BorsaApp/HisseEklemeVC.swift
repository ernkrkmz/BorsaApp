//
//  HisseEklemeVC.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 19.09.2023.
//

import UIKit

class HisseEklemeVC: UIViewController {

    @IBOutlet weak var txtHisseKodu: UITextField!
    
    @IBOutlet weak var txtHisseAdet: UITextField!
    
    @IBOutlet weak var txtHisseMaliyet: UITextField!
    
    @IBOutlet weak var btnKaydet: UIButton!
    
    var degisken1 = ""
    var degisken2 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnKaydet.isEnabled = false
        
        txtHisseKodu.text       = degisken1
        txtHisseMaliyet.text    = degisken2
        txtHisseKodu.isEnabled = false
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnKaydetClicked(_ sender: Any) {
    }
    

}
