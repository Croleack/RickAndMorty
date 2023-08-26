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
//        title = viewModel.title
        view.addSubview(detailView)
        //добавляем правую кнопку навигации
        navigationItem.rightBarButtonItem = UIBarButtonItem (barButtonSystemItem:                                                      .action,
                                                             target: self,
                                                             action: #selector(didTapShare))
        addConstraints()
        viewModel.fetchCharacterData  ()
        
    }
    
    
    @objc
    private func didTapShare() {
        //share caracter info
    }
    
    
    
    private func addConstraints() {
        NSLayoutConstraint.activate(
            [
                detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide .topAnchor),
                detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide .leftAnchor),
                detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide .rightAnchor),
                detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide .bottomAnchor),
            ])
    }
}

