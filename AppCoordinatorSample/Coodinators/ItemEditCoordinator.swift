//
//  ItemEditCoordinator.swift
//  AppCoordinatorSample
//
//  Created by SHINGAI YOSHIMI on 2018/11/22.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import Foundation

class ItemEditCoordinator: Coordinator {
    private let router: Router

    init(router: Router) {
        self.router = router
    }

    func start() {
        showItemEditView()
    }
}

private extension ItemEditCoordinator {
    func showItemEditView() {
        guard let vc = R.storyboard.itemEdit.instantiateInitialViewController() else {
            return
        }
        vc.transition = self
        router.pushViewController(vc, animated: true)
    }
}

extension ItemEditCoordinator: ItemEditTransition {
    func closeItemEditView() {
        router.dismiss(animated: true)
    }
    
    func showColorPicker() {
        
    }
}
