//
//  ViewController.swift
//  shopping list
//
//  Created by Mina Thabet on 27/08/2023.
//

import UIKit

class ViewController: UITableViewController {
    var shoppinglist = [String]()
    override func viewDidLoad() {
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "clear cart", style: .plain, target: self, action: #selector(emptyCart))
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppinglist.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = shoppinglist[indexPath.row]
        return cell
    }
    
    @objc func addItem() {
      let ac = UIAlertController(title: "add item", message: nil, preferredStyle: .alert)
      ac.addTextField()
      let addAction = UIAlertAction(title: "add", style: .default) { [weak self, weak ac] _ in
          if let input = ac?.textFields?[0].text {
              self?.addingItem(input)
          }
      }
      ac.addAction(addAction)
      present(ac, animated: true)
    }
    
    @objc func emptyCart(){
        shoppinglist.removeAll()
        tableView.reloadData()
    }
    
    func addingItem(_ input: String){
        shoppinglist.insert(input, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

