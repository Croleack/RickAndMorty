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
        
        ])
    }
    //подготовка этой ячейки к повторному использованию
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    //переопределение ячейки
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        
    }
}
