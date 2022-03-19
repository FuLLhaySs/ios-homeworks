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
    
    private var statusText: String = "Ожидание статуса..."
    
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
        //avatarImageView
        self.backgroundColor = .lightGray
        avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.image = UIImage(named: "zhdun.jpeg")
        avatarImageView.layer.cornerRadius = 75
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        
        let avatarImageViewWidth = avatarImageView.widthAnchor.constraint(equalToConstant: 150)
        let avatarImageViewHeight = avatarImageView.heightAnchor.constraint(equalToConstant: 150)
        let avatarImageViewTop = avatarImageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)
        let avatarImageViewLeading = avatarImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        
        self.addSubview(avatarImageView)
        
        //fullNameLabel
        fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.text = "Ждун ждунович"
        fullNameLabel.textAlignment = .left
        
        let fullNameLabelTop = fullNameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 27)
        let fullNameLabelLeading = fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,constant: 16)
        let fullNameLabelTrailing = fullNameLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(fullNameLabel)
        
        //showStatusButton
        setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Показать статус", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOffset.width = 4
        setStatusButton.layer.shadowOffset.height = 4
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(statusTextChanged), for: .touchUpInside)
        
        let setStatusButtonHeight = setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        self.statusButtonTop = setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16)
        let setStatusButtonLeading = setStatusButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 16)
        let setStatusButtonTrailing = setStatusButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(setStatusButton)
        
        //statusLabel
        statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = statusText
        
        let statusLabelBottom = statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16)
        let statusLabelLeading = statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16)
        let statusLabelTrailing = statusLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(statusLabel)
        
        //statusTextField
        statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.masksToBounds = true
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.alpha = 0
        
        let statusTextFieldWidth = statusTextField.widthAnchor.constraint(equalToConstant: 200)
        let statusTextFieldHeight = statusTextField.heightAnchor.constraint(equalToConstant: 40)
        let statusTextFieldTop = statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20)
        let statusTextFieldLeading = statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16)
        let statusTextFieldTrailing = statusTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -16)
        
        self.addSubview(statusTextField)
        
        
        
        
        NSLayoutConstraint.activate([
            avatarImageViewWidth,
            avatarImageViewHeight,
            avatarImageViewTop,
            avatarImageViewLeading,
            
            fullNameLabelTop,
            fullNameLabelLeading,
            fullNameLabelTrailing,
            
            setStatusButtonHeight,
            statusButtonTop,
            setStatusButtonLeading,
            setStatusButtonTrailing,
            
            statusLabelBottom,
            statusLabelLeading,
            statusLabelTrailing,
            
            statusTextFieldWidth,
            statusTextFieldHeight,
            statusTextFieldTop,
            statusTextFieldLeading,
            statusTextFieldTrailing
        ].compactMap({$0}))
        
    }
    
    @objc func statusTextChanged() {
        if self.statusTextField.alpha == 0 {
            self.statusButtonTopMoved = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 65)
            NSLayoutConstraint.deactivate([self.statusButtonTop].compactMap({$0}))
            NSLayoutConstraint.activate([self.statusButtonTopMoved].compactMap({$0}))
            self.statusTextField.alpha = 1
        } else {
            self.statusButtonTop = self.setStatusButton.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: 16)
            NSLayoutConstraint.deactivate([self.statusButtonTopMoved].compactMap({$0}))
            NSLayoutConstraint.activate([self.statusButtonTop].compactMap({$0}))
            self.statusTextField.alpha = 0
            self.statusLabel.text = self.statusTextField.text
            if self.statusLabel.text == "" {
                self.statusLabel.text = self.statusText
            }
        }
    }
    
}
