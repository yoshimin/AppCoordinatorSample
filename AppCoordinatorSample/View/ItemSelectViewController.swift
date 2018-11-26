//
//  ItemSelectViewController.swift
//  AppCoordinatorSample
//
//  Created by SHINGAI YOSHIMI on 2018/11/22.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import UIKit
import DefaultsKit

protocol ItemSelectTransition: class {
    func finishSelectItem(_ item: Item?)
    func showItemPicker(condition: AlertCoordinator.Condition)
    func showAlert(condition: AlertCoordinator.Condition)
}

class ItemSelectViewController: UITableViewController {
    private var item: Item? {
        didSet {
            itemLabel.text = item?.rawValue
        }
    }
    @IBOutlet private var itemLabel: UILabel!

    var transition: ItemSelectTransition?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTouchUp(cancelButton:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTouchUp(doneButton:)))
    }
}

private extension ItemSelectViewController {
    @objc func didTouchUp(cancelButton: UIButton) {
        transition?.finishSelectItem(nil)
    }

    @objc func didTouchUp(doneButton: UIButton) {
        guard let item = item else {
            let condition = AlertCoordinator.Condition(title: "Error",
                                                       message: "No items selected.",
                                                       preferredStyle: .alert,
                                                       actions: [UIAlertAction(title: "OK", style: .default, handler: nil)])
            transition?.showAlert(condition: condition)
            return
        }

        ItemStore.addItem(item)

        let action = UIAlertAction(title: "OK", style: .default, handler: {[weak self] _ in
            self?.transition?.finishSelectItem(item)
        })
        let condition = AlertCoordinator.Condition(title: "",
                                                   message: "Saved!",
                                                   preferredStyle: .alert,
                                                   actions: [action])
        transition?.showAlert(condition: condition)
    }
}

// MARK: - Table view data source
extension ItemSelectViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var actions: [UIAlertAction] = []
        Item.allCases.forEach { item in
            let action = UIAlertAction(title: item.rawValue, style: .default, handler: {_ in
                self.item = item
            })
            actions.append(action)
        }
        let condition = AlertCoordinator.Condition(title: nil,
                                                   message: nil,
                                                   preferredStyle: .actionSheet,
                                                   actions: actions)
        transition?.showItemPicker(condition: condition)
    }
}
