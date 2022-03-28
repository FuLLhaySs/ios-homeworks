//
//  PostViewController.swift
//  Navigation
//
//  Created by Игорь Павлов on 16.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var post: Post!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemCyan

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = post.title
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(showInfo))
    }
    
    @objc private func showInfo() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
    }
}
