//
//  RMCharacterDetalViewController.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 21.08.2023.
//

import UIKit

class RMCharacterDetalViewController: UIViewController {

    init(viewModel: RMCharacterDetalViewViewModel) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
    }
}
