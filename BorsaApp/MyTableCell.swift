//
//  MyTableCell.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 18.09.2023.
//

import UIKit

class MyTableCell: UITableViewCell {

    @IBOutlet weak var lblSym: UIView!
    
    @IBOutlet weak var lblDegisim: UILabel!
    
    @IBOutlet weak var lblFiyat: UILabel!
    
    @IBOutlet weak var lblsym2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        lblSym
        // Configure the view for the selected state
    }

}
