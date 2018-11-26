//
//  ApplicationCoordinator.swift
//  AppCoordinatorSample
//
//  Created by SHINGAI YOSHIMI on 2018/11/22.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    private let router: Router

    init(router: Router) {
        self.router = router
    }

    func start() {
        startItemListFlow()
    }
}

private extension ApplicationCoordinator {
    func startItemListFlow() {
        let coordinator = ItemListCoordinator(router: router)
        coordinator.start()
    }
}
