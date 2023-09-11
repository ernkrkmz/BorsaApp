//
//  DataClass.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 7.09.2023.
//

import Foundation
import SwiftSoup

extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
}
class DataClass {

    
    
    func getDatas(erenHandler: @escaping (String? , Error?) -> String) -> String{

        
        let milliyet = URL(string: "https://uzmanpara.milliyet.com.tr/canli-borsa/bist-TUM-hisseleri/")!
            
        let task = URLSession.shared.dataTask(with: milliyet, completionHandler: { data, response, error in
            if error != nil { return }
            guard let data = data else { return }
            guard let htmlString = String(data: data, encoding: String.Encoding.utf8) else { return }
            erenHandler(htmlString,nil)
            
          })
        task.resume()
        
        return ""
    }
    func parser(html : String , completionHandler: @escaping (Array<Substring>?, Error?) ->Void){
        do{
            let document : Document = try SwiftSoup.parse(html)
            guard let body = document.body() else {return}
//            var zebras = try body.getElementsByClass("zebra").text()
            do{
                let isimler = try body.getElementsByClass("currency").text()
                let sirketler = isimler.split(separator: " ")
                completionHandler(sirketler,nil)
                
            }
            
        }catch{}
        
    }
    var liste1: Array<String> = []
    var table_name: Array<String> = []
    var fiyatlar: Array<String> = []

    
    func parseWihtPrices(html : String , completionHandler: @escaping (Array<Substring>? , Error?) -> Void){
        do{
            let document : Document = try SwiftSoup.parse(html)
            guard let body = document.body() else {return}
            let zebras = try body.getElementsByClass("zebra").text()
            var firsthSplit = zebras.split(separator: " ")

            firsthSplit.map{
                liste1.append(String($0))
            }
            let arr = liste1
            let filtered = arr.filter { $0 != " " }
            
            let filtered2 = filtered.filter { $0 != "  " }
            print(filtered2.count)
            
//            ------------------------------------

        }catch{
            
        }
        
    }
    
}
