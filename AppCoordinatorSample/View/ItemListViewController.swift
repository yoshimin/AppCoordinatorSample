//
//  ItemListViewController.swift
//  AppCoordinatorSample
//
//  Created by SHINGAI YOSHIMI on 2018/11/22.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import UIKit

protocol ItemListTransition: class {
    func showItemCreateView()
    func showItemDetailView(item: Item)
}

class ItemListViewController: UITableViewController {
    var transition: ItemListTransition?
    var items: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTouchUp(addButton:)))
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        items = ItemStore.items()
    }
}

// MARK: - Table view data source
extension ItemListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        cell.textLabel?.text = items[indexPath.row].rawValue

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        transition?.showItemDetailView(item: item)
    }

}

private extension ItemListViewController {
    @objc func didTouchUp(addButton: UIButton) {
        transition?.showItemCreateView()
    }
}
