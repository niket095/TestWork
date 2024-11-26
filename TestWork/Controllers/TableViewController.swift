//
//  TableViewController.swift
//  TestWork
//
//  Created by Nikita Putilov on 23.11.2024.
//

import UIKit

class TableViewController: UIViewController {
    
    private let rows = Array(repeating: "Сомнительный текст", count: 10)
    
    // Сохраняем экземпляр tableView в переменной класса
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        tableView.separatorInset.bottom = 10
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .blue
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupTableView()
    }
    
    private func setupViews() {
        title = "Таблица с сомнительным текстом"
        view.backgroundColor = .blue
        
        view.addSubview(tableView)
        
        // Установка фрейма для tableView
        tableView.frame = view.bounds
    }
    
    private func setupTableView() {
        // Установка делегата и источника данных
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Ячейка №\(indexPath.row + 1)" // Изменил на indexPath.row + 1 для более удобного отображения
        cell.textLabel?.textColor = .blue // Установка цвета текста
        return cell
    }
}
