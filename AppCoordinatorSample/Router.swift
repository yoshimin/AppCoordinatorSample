//
//  Router.swift
//  AppCoordinatorSample
//
//  Created by SHINGAI YOSHIMI on 2018/11/22.
//  Copyright © 2018 SHINGAI YOSHIMI. All rights reserved.
//

import UIKit

struct Router {
    private let rootViewController: UINavigationController

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    func setViewController(_ viewController: UIViewController) {
        rootViewController.setViewControllers([viewController], animated: false)
    }

    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        rootViewController.visibleViewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    }

    func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        rootViewController.dismiss(animated: flag, completion: completion)
    }

    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        rootViewController.pushViewController(viewController, animated: animated)
    }

    func popViewController(animated: Bool) {
        rootViewController.popViewController(animated: animated)
    }

    func popToViewController(_ viewController: UIViewController, animated: Bool) {
        rootViewController.popToViewController(viewController, animated: animated)
    }

    func popToRootViewController(animated: Bool) {
        rootViewController.popToRootViewController(animated: animated)
    }
}
