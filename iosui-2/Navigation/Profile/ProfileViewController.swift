//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Игорь Павлов on 16.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    struct Post {
        let author: String
        let description: String
        let image: String
        let likes: Int
        let views: Int
    }
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.backgroundColor = .clear
        #if DEBUG
        tableView.backgroundColor = .red
        #else
        tableView.backgroundColor = .systemGray6
        #endif
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        return tableView
    }()
    
    private lazy var headerHeight: CGFloat = 250
    
    public lazy var dataSource: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setSetup()
        addDataSource()
    }
    
    private func setSetup() {
        view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5)
        ])
    }
    
    
    private func addDataSource() {
        self.dataSource.append(.init(author: "Президенты Польши, Литвы, Латвии и Эстонии поехали на поезде в Киев", description: "Лидеры стран проведут встречу с президентом Украины Владимиром Зеленским, чтобы передать ему \"слова политической и военной поддержки\". Фото возле поезда опубликовал президент Литвы Гитанас Науседа.", image: "news1", likes: 25, views: 30))
        self.dataSource.append(.init(author: "Возле Красной площади задержали жителя Москвы, который стоял с книгой Льва Толстого \"Война и мир", description: "Мужчина стоял в Александровском саду у монумента городу-герою Киеву. Его доставили в отдел полиции \"Китай-город\".", image: "news22", likes: 23, views: 28))
        self.dataSource.append(.init(author: "Куличи встали на сторону Российской Армии", description: "Пасхальный кулич в Курганской области", image: "image1", likes: 15, views: 18))
                
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
            
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let article = self.dataSource[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(author: article.author,
                                                    image: article.image,
                                                    description: article.description,
                                                    likes: article.likes,
                                                    views: article.views)
        cell.setup(with: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView()
        if section == 0 {
            headerView = ProfileHeaderView()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  headerHeight
    }
}

extension ProfileViewController: ProfileHeaderViewProtocol {
    
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        self.headerHeight = textFieldIsVisible ? 220 : 265
        UIView.animate(withDuration: 0.3, delay: 0.1) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
        self.tableView.reloadData()
    }
}
