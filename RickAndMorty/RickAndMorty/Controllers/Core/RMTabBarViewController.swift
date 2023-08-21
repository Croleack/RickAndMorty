//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 17.08.2023.
//

import UIKit
//наследуемся от контроллера панели вкладок пользовательского интерфейса
///контроллер для размещения вкладок и контроллеров корневых
final class RMTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
        
    }
    
    private func setUpTabs() {
        //создаем экземпляры для всех четырех контроллеров и просто прикрепим их к нашему контроллеру панели вкладок
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodeVC = RMEpisodeViewController()
        let settingVC = RMSettingViewController()
        
        characterVC.navigationItem.largeTitleDisplayMode = .automatic
        locationVC.navigationItem.largeTitleDisplayMode = .automatic
        episodeVC.navigationItem.largeTitleDisplayMode = .automatic
        settingVC.navigationItem.largeTitleDisplayMode = .automatic
        
        //названия
//        characterVC.title = "Characters"
//        locationVC.title = "Location"
//        episodeVC.title = "Episode"
//        settingVC.title = "Setting "
        
        //обернем их все в навигатион контроллер
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: locationVC)
        let nav3 = UINavigationController(rootViewController: episodeVC)
        let nav4 = UINavigationController(rootViewController: settingVC)
        
        //устанавливаем элемент панели вкладок, чтобы они сразу были видны
        nav1.tabBarItem = UITabBarItem(title: "Characters",
                                       image: UIImage(systemName: "person"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations",
                                       image: UIImage(systemName: "globe"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes",
                                       image: UIImage(systemName: "tv"),
                                       tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings",
                                       image: UIImage(systemName: "gear"),
                                       tag: 4 )
        
        //большой заголовок
        for nav in [nav1,nav2,nav3,nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        
        //установлены контролеры представления, которые являются функцией, которая доступна на контроллере панели вкладок
        setViewControllers(
        [nav1,nav2,nav3,nav4],
        animated: true
        )
        
    }


}

