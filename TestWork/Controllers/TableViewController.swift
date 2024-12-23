//
//  TableViewController.swift
//  TestWork
//
//  Created by Nikita Putilov on 23.11.2024.
//

import UIKit

class TableViewController: UIViewController {
    
    private let rows = Array(repeating: "", count: 30)
    
    // Сохраняем экземпляр tableView в переменной класса
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        tableView.separatorInset.right = 10
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
    
    private func setupViews() {
        title = "Таблица с сомнительным текстом"
        view.backgroundColor = .tableBackgroundTableView
        
        view.addSubview(tableView)
        
        // Установка фрейма для tableView
        tableView.frame = view.bounds
    }
    
    private func setupTableView() {
        // Установка делегата и источника данных
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func animationTableView() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight = tableView.bounds.height
        var delay: Double = 0 //задержка по выходу каждой ячейки
        
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
}
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Сомнительный текст" // Изменил на indexPath.row + 1 для более удобного отображения
        cell.textLabel?.textColor = .white // Установка цвета текста
        cell.backgroundColor = .tableBackgroundTableView
        return cell
    }
}
