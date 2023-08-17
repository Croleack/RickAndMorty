//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 17.08.2023.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//.systemBackground - означает, что система будет поддерживать цвет зависимоти от режима(белый при дневном режиме)
        view.backgroundColor = .systemBackground
        title = "Characters"
    }
    

}
