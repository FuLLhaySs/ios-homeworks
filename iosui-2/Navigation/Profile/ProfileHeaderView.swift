//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Игорь Павлов on 16.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var fullNameLabel: UILabel!
    var statusLabel: UILabel!
    var avatarImageView: UIImageView!
    var setStatusButton: UIButton!
    var statusTextField: UITextField!
    
    private var statusText: String? = "Ожидание статуса..."
    
    private var statusButtonTop: NSLayoutConstraint?
    private var statusButtonTopMoved: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = .lightGray
        //avatarImageView
        let avatarImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "zhdun.jpeg")
            imageView.layer.cornerRadius = 75
            imageView.layer.borderWidth = 3
            imageView.layer.masksToBounds = true
            imageView.layer.borderColor = UIColor.white.cgColor
        
            return imageView
        }()
        self.avatarImageView = avatarImageView
        self.addSubview(avatarImageView)
        
        //fullNameLabel
        let fullNameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            label.text = "Ждун ждунович"
            label.textAlignment = .left
            
            return label
        }()
        self.fullNameLabel = fullNameLabel
        self.addSubview(fullNameLabel)
        
        //setStatusButton
        let setStatusButton: UIButton = {
            let setButton = UIButton()
            setButton.translatesAutoresizingMaskIntoConstraints = false
            setButton.setTitle("Установить статус", for: .normal)
            setButton.setTitleColor(.white, for: .normal)
            setButton.backgroundColor = .systemBlue
            setButton.layer.cornerRadius = 4
            setButton.layer.shadowOffset.width = 4
            setButton.layer.shadowOffset.height = 4
            setButton.layer.shadowRadius = 4
            setButton.layer.shadowColor = UIColor.black.cgColor
            setButton.layer.shadowOpacity = 0.7
            setButton.addTarget(self, action: #selector(statusTextChanged), for: .touchUpInside)
            return setButton
        }()
        self.setStatusButton = setStatusButton
        self.addSubview(setStatusButton)
        
        //statusLabel
        let statusLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textColor = .gray
            label.text = statusText
            
            return label
        }()
        self.statusLabel = statusLabel
        self.addSubview(statusLabel)
        
        //statusTextField
        let statusTextField: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textField.textColor = .black
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 12
            textField.layer.masksToBounds = true
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            
            
        return textField
        }()
        self.statusTextField = statusTextField
        self.addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            avatarImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16),
            
            fullNameLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 70),
            setStatusButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            
            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            statusTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            statusTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
    
   
    
    @objc func statusTextChanged() {
        self.statusLabel.text = self.statusTextField.text
                  if self.statusLabel.text == "" {
                      self.statusLabel.text = self.statusText
    }
}
}
