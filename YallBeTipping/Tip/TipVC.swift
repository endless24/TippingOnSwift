//
//  TipVC.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 10/02/2025.
//

import UIKit

class TipVC: UIViewController {
    
    static let id = "TipVC"
    
    //    Create button for navigation
        lazy var barButton: UIBarButtonItem = {
            let button = UIBarButtonItem(
                title: "Submit",
                style: .plain,
                target: self,
                action: #selector(didTapBarButton))
            return button
        }()
    @IBOutlet weak var smallTipButton: UIButton!
    @IBOutlet weak var largeTipButton: UIButton!
    @IBOutlet weak var mediumTipButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    lazy var tipSelections: [UIButton] = [
        smallTipButton,
        mediumTipButton,
        largeTipButton,
        skipButton
    ]
    var tipAmount: TipOptions = .small
    
    let items: [MenuItem]
    
    init(coder:NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tips"
        navigationItem.rightBarButtonItem = barButton
        skipButton.layer.cornerRadius = 10
        stackView.arrangedSubviews.forEach { button in
            button.layer.cornerRadius = 20
        }
        smallTipButton.isSelected = true
    }
    
//    taggeting if its on portrait or langscape
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        let orientation = UIDevice.current.orientation
        if orientation.isPortrait{
            stackView.axis = .vertical
        } else if orientation.isLandscape{
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
        super.viewWillTransition(to: size, with: coordinator)
    }
 
    @objc func didTapBarButton() {
        let sb = UIStoryboard(
            name: ReceiptVC.id,
            bundle: nil)
        let vc = sb.instantiateViewController(identifier: ReceiptVC.id) {[unowned self] coder in
            let receiptVC = ReceiptVC(coder: coder, items: items, tip: tipAmount)
            return receiptVC
        }
        pushVC(vc)
    }
    
//    DeSelecting button
    func deselectButton() {
        tipSelections.forEach{button in
            button.isSelected = false
        }
    }
    
    @IBAction func didTapSmallTipButton() {
        deselectButton()
        smallTipButton.isSelected = true
        tipAmount = .small
    }
    
    @IBAction func didTapMediumTipButton() {
        deselectButton()
        mediumTipButton.isSelected = true
        tipAmount = .medium
    }
    
    @IBAction func didTapLargeTipButton() {
        deselectButton()
        largeTipButton.isSelected = true
        tipAmount = .large
    }
    
    @IBAction func didTapSkipButton() {
        deselectButton()
        skipButton.isSelected = true
        tipAmount = .none
    }
    
}
