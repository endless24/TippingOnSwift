//
//  ReceiptTotalRow.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 27/03/2025.
//

import UIKit

class ReceiptTotalRow: UITableViewCell {
    
    static let id = "ReceiptTotalRow"
    
    @IBOutlet private weak var totalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(total: Double){
        totalLabel.text = total.toCurrency()
    }
    
}
