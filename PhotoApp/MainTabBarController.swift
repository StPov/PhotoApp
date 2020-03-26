//
//  MainTabBarController.swift
//  PhotoApp
//
//  Created by Stanislav Povolotskiy on 26.03.2020.
//  Copyright © 2020 Stanislav Povolotskiy. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let photosVC = PhotosCollectionViewController(collectionViewLayout: WaterfallLayout())
        
        let likesVC = LikesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Фотографии", image: #imageLiteral(resourceName: "photos")),
            generateNavigationController(rootViewController: likesVC, title: "Избранное", image: #imageLiteral(resourceName: "heart"))
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if Core.share.isNewUser() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyboard.instantiateViewController(withIdentifier: "welcome") as? WelcomeVC {
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: true)
            }
        }
    }
}
