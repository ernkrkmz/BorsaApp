//
//  ViewController.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 4.09.2023.
//

import UIKit
import SwiftSoup


class ViewController: UIViewController {

    @IBOutlet weak var selectBar: UIButton!
    
    @IBOutlet weak var myLabel: UILabel!
    
    var myHtmlString = "boş myHtmlStr"
    
    
    func getHtmlPage(){
        var funcHtmlString = "boş myHtmlStr"

        let milliyet = URL(string: "https://uzmanpara.milliyet.com.tr/canli-borsa/bist-TUM-hisseleri/")!
        let task = URLSession.shared.dataTask(with: milliyet) { [self] data, response, error in
            guard let data = data else {
                print("data was nil")
                return
            }
            guard let htmlString = String(data: data, encoding: String.Encoding.utf8) else {
                print("htmlString problem")
                return
            }
            
            DispatchQueue.main.async{
                self.myHtmlString = htmlString
            }
            
            parser(html: htmlString)
        }
        task.resume()
        
    }

    func parser(html : String){
        do{
            let document : Document = try SwiftSoup.parse(html)
            guard let body = document.body() else {return}
            var zebras = try body.getElementsByClass("zebra").text()
            do{
                let isimler = try body.getElementsByClass("currency").text()
                
            }
            
//            DispatchQueue.main.async {
//                self.myLabel.text = zebras
//
//            }
            
        }catch{
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getHtmlPage()
        
        
    }


    
}

