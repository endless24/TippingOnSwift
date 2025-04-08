//
//  HomeVC.swift
//  YallBeTipping
//
//  Created by Joseph Iroh on 10/02/2025.
//

import UIKit

class HomeVC: UIViewController {
    
    private var data :[MenuItem] = []
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        calling the fucntions
        title = "Menu"
        fetchData()
        setupTableView()
    }
    
//    fetching the data
    private func fetchData(){
        data = Api.shared.fetchApiData()
    }
    
//      setup table the data the table
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction private func didTapCartButton(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(
            name: ConfirmVC.id,
            bundle: nil)
        let items = getItemsInCart()
        let vc = sb.instantiateViewController(
            identifier: ConfirmVC.id) {  coder in
                let confirmVC = ConfirmVC(coder: coder,items: items)
                return confirmVC
        }
//        pushing confirmVC on top navigation viewController stack
        pushVC(vc)
    }
    
//    func to get items that is in the cart
    private  func getItemsInCart() -> [MenuItem]{
        var items : [MenuItem] = []
       for item in data{
           if item.quantity > 0{
               items.append(item)
           }
        }
        return items
    }

}

extension HomeVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(
        withIdentifier: HomeTableCell.id,
            for: indexPath) as! HomeTableCell
        
        let item = data[indexPath.row]
        cell.configure(item: item, indexPath: indexPath)
        cell.delegate = self
        return cell
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.row].quantity += 1
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension HomeVC: HomeTableCellDelegate {
    func didAdd(at indexPath: IndexPath) {
        data[indexPath.row].quantity += 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func didMinus(at indexPath: IndexPath) {
        data[indexPath.row].quantity -= 1
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
