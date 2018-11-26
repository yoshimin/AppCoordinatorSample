//
//  ItemListCoordinator.swift
//  AppCoordinatorSample
//
//  Created by SHINGAI YOSHIMI on 2018/11/22.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import UIKit

class ItemListCoordinator: Coordinator {
    private let router: Router

    init(router: Router) {
        self.router = router
    }

    func start() {
        showItemListView()
    }
}

private extension ItemListCoordinator {
    func showItemListView() {
        guard let vc = R.storyboard.itemList.instantiateInitialViewController() else {
            return
        }
        vc.transition = self
        router.setViewController(vc)
    }

    func startItemSelectFlow() {
        guard let rootViewController = R.storyboard.navigation.instantiateInitialViewController() else {
            return
        }
        router.present(rootViewController, animated: true)

        let itemCreateRouter = Router(rootViewController: rootViewController)
        ItemCreateCoordinator(router: itemCreateRouter, onFinishFlow: {item in
            self.router.dismiss(animated: true, completion: {
                guard let item = item else { return }
                self.startItemDetailFlow(item: item)
            })
        }).start()
    }

    func startItemDetailFlow(item: Item) {
        SafariViewCoordinator(router: router, url: item.url).start()
    }
}

extension ItemListCoordinator: ItemListTransition {
    func showItemCreateView() {
        startItemSelectFlow()
    }

    func showItemDetailView(item: Item) {
        startItemDetailFlow(item: item)
    }
}
