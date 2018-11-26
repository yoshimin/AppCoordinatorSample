//
//  SafariViewCoordinator.swift
//  AppCoordinatorSample
//
//  Created by SHINGAI YOSHIMI on 2018/11/26.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import SafariServices

class SafariViewCoordinator: Coordinator {
    private let router: Router
    private let url: String

    init(router: Router, url: String) {
        self.router = router
        self.url = url
    }

    func start() {
        showSafariViewController()
    }
}

private extension SafariViewCoordinator {
    func showSafariViewController() {
        guard let url = URL(string: url) else { return }
        let vc = SFSafariViewController(url: url)
        router.present(vc, animated: true)
    }
}

