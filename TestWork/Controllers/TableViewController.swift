//
//  TableViewController.swift
//  TestWork
//
//  Created by Nikita Putilov on 23.11.2024.
//

import UIKit

class TableViewController: UIViewController {
    
    //MARK: - UI elements
    private let rows = Array(repeating: "", count: 30)
    
    private let backButton = UIButton(colorTint: .systemBlue,
                                      image: "chevron.backward",
                                      colorBorder: UIColor.tableBackgroundTableView.cgColor)
    
    private let titleLabel = UILabel(text: "Таблица с сомнительным текстом",
                                     font: .systemFont(ofSize: 25, weight: .bold),
                                     color: .black,
                                     line: 1)
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        tableView.separatorInset.right = 10
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - Life cicle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animationTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTableView()
        setConstraints()
        setTarget()
    }
    
    //MARK: - Setup
    private func setupViews() {
        view.backgroundColor = .tableBackgroundTableView
        
        view.addSubview(tableView)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func animationTableView() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight = tableView.bounds.height
        var delay: Double = 0
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            
            UIView.animate(withDuration: 1,
                           delay: delay * 0.1,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 1.2,
                           options: .allowUserInteraction) {
                cell.transform = CGAffineTransform.identity
            }
            delay += 1
        }
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 300),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - Extension table
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Сомнительный текст"
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .tableBackgroundTableView
        return cell
    }
}

//MARK: - Target
extension TableViewController {
    private func setTarget() {
        backButton.addTarget(self, action: #selector(backMainViewController), for: .touchUpInside)
    }
    
    @objc private func backMainViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}
