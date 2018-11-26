//
//  ItemCreateCoordinator.swift
//  AppCoordinatorSample
//
//  Created by SHINGAI YOSHIMI on 2018/11/22.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import UIKit

class ItemCreateCoordinator: Coordinator {
    private let router: Router
    private let onFinishFlow: (Item?)->()

    init(router: Router, onFinishFlow: @escaping (Item?)->()) {
        self.router = router
        self.onFinishFlow = onFinishFlow
    }

    func start() {
        showItemCreateView()
    }
}

private extension ItemCreateCoordinator {
    func showItemCreateView() {
        guard let vc = R.storyboard.itemSelect.instantiateInitialViewController() else {
            return
        }
        vc.transition = self
        router.setViewController(vc)
    }

    func startAlertFlow(condition: AlertCoordinator.Condition) {
        let coodinator = AlertCoordinator(router: router, condition: condition)
        coodinator.start()
    }
}

extension ItemCreateCoordinator: ItemSelectTransition {
    func showAlert(condition: AlertCoordinator.Condition) {
        startAlertFlow(condition: condition)
    }

    func showItemPicker(condition: AlertCoordinator.Condition) {
        startAlertFlow(condition: condition)
    }
    
    func finishSelectItem(_ item: Item?) {
        onFinishFlow(item)
    }
}
