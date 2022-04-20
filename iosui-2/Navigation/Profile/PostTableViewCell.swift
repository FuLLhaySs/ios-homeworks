//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Игорь Павлов on 14.04.2022.
//
import UIKit

class PostTableViewCell: UITableViewCell {
    
    struct ViewModel: ViewModelProtocol {
        let author: String
        let image: String
        let description: String
        var likes: Int
        var views: Int
    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.backgroundColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
                label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
                label.textColor = .black
                label.backgroundColor = .white
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headerLabel.text = nil
        pictureImageView.image = nil
        descriptionLabel.text = nil
        likesLabel.text = nil
        viewsLabel.text = nil
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
        contentView.addSubview(backView)
        backView.addSubview(headerLabel)
        backView.addSubview(pictureImageView)
        backView.addSubview(descriptionLabel)
        backView.addSubview(likesLabel)
        backView.addSubview(viewsLabel)
    
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            headerLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            headerLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            headerLabel.bottomAnchor.constraint(equalTo: pictureImageView.topAnchor, constant: -16),

            pictureImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            pictureImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            pictureImageView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -16),
            pictureImageView.heightAnchor.constraint(equalTo: pictureImageView.widthAnchor, multiplier: 1.0),

            descriptionLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),
            ])
}
}
extension PostTableViewCell: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        
        headerLabel.text = viewModel.author
        descriptionLabel.text = viewModel.description
        pictureImageView.image = UIImage(named: viewModel.image)
        likesLabel.text = "Likes: \(String(viewModel.likes))"
        viewsLabel.text = "Views: \(String(viewModel.views))"
    }
}


