//
//  AlertCoordinator.swift
//  AppCoordinatorSample
//
//  Created by Yoshimi Shingai on 2018/11/23.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import UIKit

class AlertCoordinator: Coordinator {
    struct Condition {
        let title: String?
        let message: String?
        let preferredStyle: UIAlertController.Style
        let actions: [UIAlertAction]
    }
    
    private let router: Router
    private let condition: Condition
    
    init(router: Router, condition: Condition) {
        self.router = router
        self.condition = condition
    }
    
    func start() {
        showAlertController()
    }
}

private extension AlertCoordinator {
    func showAlertController() {
        let alert = UIAlertController(title: condition.title,
                                      message: condition.message,
                                      preferredStyle: condition.preferredStyle)
        condition.actions.forEach { alert.addAction($0) }
        
        router.present(alert, animated: true)
    }
}
