//
//  TabBarViewController.swift
//  S.O.F.E
//
//  Created by Meme Mhd on 20/09/2020.
//  Copyright © 2020 S.O.F.E. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    fileprivate lazy var defaultTabBarHeight = { tabBar.frame.size.height }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        let home = HomeViewController()
        let homeIcone = UITabBarItem(title: "home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        home.tabBarItem = homeIcone

        let order = OrderViewController()
        let orderIcone = UITabBarItem(title: "order", image: UIImage(systemName: "bag.badge.plus"), selectedImage: UIImage(systemName: "bag.fill.badge.plus"))
        order.tabBarItem = orderIcone
        
        
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.selectedImageTintColor = .black
        
        let controllers = [home, order]
        self.viewControllers = controllers
        delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        let newTabBarHeight = defaultTabBarHeight - 10
//
//                var newFrame = tabBar.frame
//                newFrame.size.height = newTabBarHeight
//                newFrame.origin.y = view.frame.size.height - newTabBarHeight
//
//                tabBar.frame = newFrame
    }
}
extension TabBarViewController: UITabBarControllerDelegate{
func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return MyTransition(viewControllers: tabBarController.viewControllers)
    }
}

class MyTransition: NSObject, UIViewControllerAnimatedTransitioning {

    let viewControllers: [UIViewController]?
    let transitionDuration: Double = 1

    init(viewControllers: [UIViewController]?) {
        self.viewControllers = viewControllers
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(transitionDuration)
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard
            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let fromView = fromVC.view,
            let fromIndex = getIndex(forViewController: fromVC),
            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let toView = toVC.view,
            let toIndex = getIndex(forViewController: toVC)
            else {
                transitionContext.completeTransition(false)
                return
        }

        let frame = transitionContext.initialFrame(for: fromVC)
        var fromFrameEnd = frame
        var toFrameStart = frame
        fromFrameEnd.origin.x = toIndex > fromIndex ? frame.origin.x - frame.width : frame.origin.x + frame.width
        toFrameStart.origin.x = toIndex > fromIndex ? frame.origin.x + frame.width : frame.origin.x - frame.width
        toView.frame = toFrameStart

        DispatchQueue.main.async {
            transitionContext.containerView.addSubview(toView)
            UIView.animate(withDuration: self.transitionDuration, animations: {
                fromView.frame = fromFrameEnd
                toView.frame = frame
            }, completion: {success in
                fromView.removeFromSuperview()
                transitionContext.completeTransition(success)
            })
        }
    }

    func getIndex(forViewController vc: UIViewController) -> Int? {
        guard let vcs = self.viewControllers else { return nil }
        for (index, thisVC) in vcs.enumerated() {
            if thisVC == vc { return index }
        }
        return nil
    }
}
