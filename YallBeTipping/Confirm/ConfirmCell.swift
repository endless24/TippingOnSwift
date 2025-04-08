//
//  ConfirmCell.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 19/02/2025.
//

import UIKit

protocol ConfirmCellDelegate: AnyObject {
    func didAdd(at indexPath: IndexPath)
    func didMinus(at indexPath: IndexPath)
}

class ConfirmCell: UITableViewCell {
    
    static let id = "ConfirmCell"
    
    weak var delegate: ConfirmCellDelegate?
    
    private var indexPath: IndexPath?
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabe: UILabel!
    @IBOutlet private weak var img: UIImageView!
    
    
    @IBOutlet private weak var increButton: UIButton!
    @IBOutlet private weak var qtyLabel: UILabel!
    @IBOutlet private weak var decreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //    making the IncreButton and DecreButton rounded
        override func layoutSubviews() {
            super.layoutSubviews()
            img.layer.cornerRadius = 15
            increButton.layer.cornerRadius = increButton.frame.height / 2
            decreButton.layer.cornerRadius = decreButton.frame.height / 2
        }
    
    func configure(item: MenuItem, indexPath: IndexPath){
        self.indexPath = indexPath
        nameLabel.text = item.name
        priceLabe.text = item.price.toCurrency()
        img.image = UIImage(named: item.img)
        qtyLabel.text = "\(item.quantity)"
        
    }
    
    @IBAction private func didTabIncreButton() {
        guard let indexPath else{ return }
        delegate?.didAdd(at: indexPath)
    }
    
    @IBAction private func didTabDecreButton() {
        guard let indexPath else{ return }
        delegate?.didMinus(at: indexPath)
    }
    
}
