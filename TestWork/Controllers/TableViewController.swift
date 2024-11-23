//
//  TableViewController.swift
//  TestWork
//
//  Created by Nikita Putilov on 23.11.2024.
//

import UIKit

class TableViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .red //цвет сепаратора
        tableView.separatorInset.right = 16 //отступ справа сепааратора
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animationTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTableView()
    }
    
    private func animationTableView() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight = tableView.bounds.height
        var delay: Double = 0 //задержка по выходу каждой ячейки
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
            
            UIView.animate(withDuration: 1.5,
                           delay: delay * 0.5,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 1.2,
                           options: .autoreverse) {
                cell.transform = CGAffineTransform.identity
            }
            delay += 1
        }
    }
    
    private func setupViews() {
        title = "Таблица"
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        
    }
    
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        // cтандартная ячейка
        // tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // кастомная ячейка
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.cellID)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    //количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
}
