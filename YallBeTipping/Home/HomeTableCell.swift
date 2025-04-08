//
//  HomeTableCell.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 13/02/2025.
//

import UIKit

protocol HomeTableCellDelegate: AnyObject {
    func didAdd(at indexPath: IndexPath)
    func didMinus(at indexPath: IndexPath)
}

class HomeTableCell: UITableViewCell {
    
    static let id = "HomeTableCell"
    
    weak var delegate: HomeTableCellDelegate?
    private var indexPath: IndexPath?
    
//name,price and Image
    @IBOutlet private weak var img: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    @IBOutlet private weak var orderCountStackView: UIStackView!
    
    
    //Quatity button
    @IBOutlet private weak var IncreButton: UIButton!
    @IBOutlet private weak var countLabel: UILabel!
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
        IncreButton.layer.cornerRadius = IncreButton.frame.height / 2
        decreButton.layer.cornerRadius = decreButton.frame.height / 2
    }
    
    
    func configure(item: MenuItem, indexPath: IndexPath){
        self.indexPath = indexPath
        nameLabel.text = item.name
        priceLabel.text = item.price.toCurrency()
        img.image = UIImage(named: item.img)
        countLabel.text = "\(item.quantity)"
        
        if item.quantity > 0 {
            orderCountStackView.isHidden = false
        }else {
            orderCountStackView.isHidden = true
        }
    }
    
    @IBAction private func didTapIncreButton() {
        guard let indexPath else{ return }
        delegate?.didAdd(at: indexPath)
    }
    
    @IBAction private func didTapDecreButton() {
        guard let indexPath else{ return }
        delegate?.didMinus(at: indexPath)
    }
}
