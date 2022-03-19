//
//  InfoViewController.swift
//  Navigation
//
//  Created by Игорь Павлов on 16.03.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Удалить публикацию?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemFill
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(alertButton)
        NSLayoutConstraint.activate([
        alertButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        alertButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        alertButton.heightAnchor.constraint(equalToConstant: 50)
])
    }
    
    @objc private func showAlert() {
        let ac = UIAlertController(title: "Подтверждение действия", message: "Данная публикация будет удалена безвозвратно", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Да", style: .default, handler: { _ in print("Успешно удалена")
        }))
        ac.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        present(ac, animated: true)
    }
}
