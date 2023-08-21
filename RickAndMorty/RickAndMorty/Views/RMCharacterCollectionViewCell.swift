//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Enzhe Gaysina on 18.08.2023.
//

import UIKit
//мы должны фактически зарегистрировать эту ячейку для персонажа
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMСharacterCollectionViewCell"
    //представление нашего изображения
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel ()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18,
                                 weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel ()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16,
                                 weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        //цвет фона контента снова будет вторичным
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(statusLabel)
        addConstraint()
    }
    required init? (coder:NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
        //указываем параметры размещения всех элементов на одной ячейки (Размеры высоты)
            statusLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
           
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),
        ])
        
        
        /*
         | Image |
         | name  |
         | status|
         
         */
        
        
    }
    //подготовка этой ячейки к повторному использованию
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    //переопределение ячейки. в этом куске очень важная информация о утечке памяти 
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.characterName
        //выборка изображения. weak self - чтобы не было утечки памяти
        viewModel.fetchImage { [weak self]result in
            switch result {
            case .success(let data):
                //создаем изображение в основном потоке
                DispatchQueue.main.async {
                    //изображение - это изображение пользовательского интерефейса
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case.failure(let error):
                print(String(describing: error))
                break
            }
            
        }
    }
}
