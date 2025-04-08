//
//  ConfirmVC.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 10/02/2025.
//

import UIKit

class ConfirmVC: UIViewController {
    
    static let id = "ConfirmVC"
    
//    Create button for navigation
    private  lazy var barButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            title: "Submit",
            style: .plain,
            target: self,
            action: #selector(didTapBarButton))
        return button
    }()
  
    @IBOutlet private weak var tableView: UITableView!
    
    private  var items: [MenuItem]
    
    init(coder: NSCoder, items: [MenuItem]) {
        self.items = items
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm"
        setupTableView()
        navigationItem.rightBarButtonItem = barButton
    }
    
    //      setup table the data the table
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UINib(nibName: ConfirmCell.id, bundle: nil), forCellReuseIdentifier: ConfirmCell.id)
    }
    
    @objc private func didTapBarButton() {
        let sb = UIStoryboard(
            name: TipVC.id,
            bundle: nil)
        let vc = sb.instantiateViewController(
            identifier: TipVC.id) {[unowned self] coder in
                let tipVc = TipVC(coder: coder, items: items)
                return tipVc
        }
        pushVC(vc)
    }
}

extension ConfirmVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConfirmCell.id, for: indexPath) as! ConfirmCell
        
        let item = items[indexPath.row]
        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension ConfirmVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
}

extension ConfirmVC: ConfirmCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        items[indexPath.row].quantity += 1
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func didMinus(at indexPath: IndexPath) {
        items[indexPath.row].quantity -= 1
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
