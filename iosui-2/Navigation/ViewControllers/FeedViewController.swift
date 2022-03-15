//
//  FeedViewController.swift
//  Navigation
//
//  Created by Игорь Павлов on 16.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var postButton: UIButton!
    
    var post = Post()
    
    override func loadView() {
        view = UIView()
        
        postButton = UIButton()
        postButton.backgroundColor = .systemCyan
        postButton.layer.borderWidth = 1
        postButton.layer.cornerRadius = 5
        postButton.frame = CGRect(x: 20, y: 200, width: 100, height: 50)
        postButton.setTitle("Пост", for: .normal)
        postButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        view.addSubview(postButton)
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc func showPost() {
        let postVC = PostViewController()
        postVC.post = post
        self.navigationController?.pushViewController(postVC, animated: true)
    }

}
