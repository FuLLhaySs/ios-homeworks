//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Игорь Павлов on 26.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let screen = UIScreen.main.bounds.width
        if let myView = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            myView.frame = CGRect(x: 16, y: 150, width: screen - 32 , height: 400)
            view.addSubview(myView)
        }
    }

}
