//
//  LoginVC.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 19.09.2023.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var txteposta: UITextField!
    
    @IBOutlet weak var txtsifre: UITextField!
    
    @IBOutlet weak var btngirisyap: UIButton!
    
    @IBOutlet weak var btnkayitol: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func girisyapClicked(_ sender: Any) {
        if txteposta.text != "" && txtsifre.text != "" {
            
            Auth.auth().signIn(withEmail: txteposta.text!, password: txtsifre.text!) { authDataResult, error in
                if error != nil {
                    self.hataMesajiGoster(title: "HATA", message: "E posta veya şifre hatalı !")
                }else{
                    self.performSegue(withIdentifier: "toMainVC", sender: nil)
                }
            }
            
        }else{
            self.hataMesajiGoster(title: "hata", message: "email veya parola boş olamaz")
        }
    }
    
    
    @IBAction func kayitolClicked(_ sender: Any) {
        if txteposta.text != "" && txtsifre.text != "" {
            Auth.auth().createUser(withEmail: txteposta.text!, password: txtsifre.text!) { (authDataResult, error) in
                if error != nil {
                    self.hataMesajiGoster(title: "Error", message: error!.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "toMainVC", sender: nil)
                }
            }
        }
        else{
            hataMesajiGoster(title: "Error", message: "Boş bırakma")
        }
    }
    
    func hataMesajiGoster(title : String , message : String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okBtn)
        self.present(alert, animated: true , completion: nil)
        
    }
}
