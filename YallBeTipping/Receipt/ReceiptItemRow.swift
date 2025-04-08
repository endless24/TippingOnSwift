//
//  ReceiptItemRow.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 27/03/2025.
//

import UIKit

class ReceiptItemRow: UITableViewCell {
    
    static let id = "ReceiptItemRow"

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var qtyLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(item:MenuItem){
        nameLabel.text = item.name
        qtyLabel.text = "x\(item.quantity)"
        let qty = Double(item.quantity)
        let totalPrice = qty * item.price
        priceLabel.text = totalPrice.toCurrency()
        
    }
}
