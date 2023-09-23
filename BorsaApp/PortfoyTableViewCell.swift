//
//  PortfoyTableViewCell.swift
//  BorsaApp
//
//  Created by Eren Korkmaz on 21.09.2023.
//

import UIKit

class PortfoyTableViewCell: UITableViewCell {

    @IBOutlet weak var lblHisse: UILabel!
    
    @IBOutlet weak var lblAdet: UILabel!
    
    @IBOutlet weak var lblMaliyet: UILabel!
    
    @IBOutlet weak var lblGuncelFiyat: UILabel!
    
    @IBOutlet weak var lblGuncelTutar: UILabel!
    
    @IBOutlet weak var lblKarZarar: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
