//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Игорь Павлов on 16.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String? = "Waiting for something"
    private var statusButtonTop: NSLayoutConstraint?
    private var statusButtonTopMoved: NSLayoutConstraint?
    
    
    //avatarImageView
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "zhdun.jpeg")
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 3
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        
        return imageView
    }()
    
    //fullNameLabel
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Ждун ждунович"
        label.textAlignment = .left
        
        return label
    }()
    
    //setStatusButton
    private lazy var setStatusButton: UIButton = {
        let setButton = UIButton()
        setButton.translatesAutoresizingMaskIntoConstraints = false
        setButton.setTitle("Set status", for: .normal)
        setButton.setTitleColor(.white, for: .normal)
        setButton.backgroundColor = .systemBlue
        setButton.layer.cornerRadius = 8
        setButton.layer.shadowOffset.width = 4
        setButton.layer.shadowOffset.height = 4
        setButton.layer.shadowRadius = 4
        setButton.layer.shadowColor = UIColor.black.cgColor
        setButton.layer.shadowOpacity = 0.7
        setButton.addTarget(self, action: #selector(statusTextChanged), for: .touchUpInside)
        return setButton
    }()
    
    
    //statusLabel
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = statusText
        
        return label
    }()
    
    
    //statusTextField
   private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.placeholder = "Set your status..."
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        
        
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .systemGray6
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
        
        
        NSLayoutConstraint.activate([
            // аватарка
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
            avatarImageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16),
            
            // имя фамилия
            fullNameLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 5),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            
            // сет статус синяя
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -5),
            
            // waiting for something
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -5),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            
            // set your status
            statusTextField.widthAnchor.constraint(equalToConstant: 170),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10)
        ])
    }
    
    func hideKeyboard() {
        self.statusTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
    
    @objc func statusTextChanged() {
        statusLabel.text = statusTextField.text
        if statusLabel.text == "" {
            statusLabel.text = statusText
        }
    }
    
    func changeTitle(title: String) {
            self.fullNameLabel.text = title
        }
}
