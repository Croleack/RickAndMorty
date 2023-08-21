//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 18.08.2023.
//

import UIKit

protocol CharacterListViewDelegate: AnyObject {
    func rmCharacterListView(
        _ characterListView: CharacterListView,
        didSelectCharacter character: RMCharacter
    )
}

///представление брабатывают отображение списка, загрузчика символов
 final class CharacterListView: UIView {
    
    public weak var delegate: CharacterListViewDelegate?
    
    private let viewModel = CharacterListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        //cкрывает при остановке
        spinner.hidesWhenStopped = true
        //переводит маску автоматически изменяет размер
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    //смоделируем сетку представления коллекция
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //вставка в макете
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        //красивая анимация
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //индентификатор cell
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    
//переопределим
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        //вспомогательное представление
        addSubViews(collectionView, spinner)
        addConstraint()
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchCharacters()
        
        setUpColectionView()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //дополнительная функция о добавлении ограничении
    private func addConstraint() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func setUpColectionView() {
        collectionView.dataSource = viewModel
        //создаем два столбца
        collectionView.delegate = viewModel
        
        
        //избався от счетчика и покажи представление коллекции через 2 секунды
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.spinner.stopAnimating()
            
            self.collectionView.isHidden = false
            //уже не прозрачно
            UIView.animate(withDuration: 0.4, animations: {
                self.collectionView.alpha = 1
            })
        })
    }
}

extension CharacterListView: RMCharacterListViewViewModelDelegate {
    func didLoadInitialCharacters() {
        collectionView.reloadData()
    }
    
    
    func didSelectCharacter(_ character: RMCharacter) {
        
        delegate?.rmCharacterListView(self, didSelectCharacter: character)
    }
}
