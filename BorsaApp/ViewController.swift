//
//  ViewController.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 4.09.2023.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {

    @IBOutlet weak var btnHisseEkle: UIButton!
    
    var symbolList: Array<Substring> = []

    
    var myHtmlString = "boş myHtmlStr"
    var array_name = [String]()
    
    func getHtmlPage(){

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
//            var zebras = try body.getElementsByClass("zebra").text()
            do{
                let isimler = try body.getElementsByClass("currency").text()
                let sirketler = isimler.split(separator: " ")
                print(sirketler)
                

            }
            
//            DispatchQueue.main.async {
//
//
//            }
            
        }catch{
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cls = DataClass()
        let asd = cls.getDatas(erenHandler: { str, err in
            guard let str = str else {return "bos geldi"}
            cls.parser(html: str) { data, error in
                
                print(type(of: data!))
                
                    self.symbolList.append(contentsOf: data!)
                    
            }

            cls.parseWihtPrices(html: str) { arry, error in
                
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
            destinationVC.gelenSymbols = symbolList
            print(symbolList.count)
        }
    }
    
    @IBAction func portfoyClicked(_ sender: Any) {
        print(self.symbolList)
    }
    
}

