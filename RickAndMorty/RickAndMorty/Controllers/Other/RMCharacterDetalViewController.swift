//
//  RMCharacterDetalViewController.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 21.08.2023.
//

import UIKit

class RMCharacterDetalViewController: UIViewController {
    
    private let detailView = RMCharacterDetalView()
    
    // MARK: - INIT

    init(viewModel: RMCharacterDetalViewViewModel) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(detailView)
        
    }
  
    }
//не доделал 
//        addConstraints()
//        viewModel.fetchCharacterData()
        
        
   
    
//    private func addConstraints() {
//        NSLayoutConstraint.activate(
//            [
//
//                detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide .topAnchor),
//                detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide .leftAnchor),
//                detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide .rightAnchor),
//                detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide .bottomAnchor),
//            ]
//        )
//    }

