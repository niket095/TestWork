//
//  CalculatorViewController.swift
//  TestWork
//
//  Created by Nikita Putilov on 24.11.2024.
//

import UIKit

class CalculatorViewController: UIViewController{
    
    private let smileLabel = UILabel(text: "🙂 = 1😂 = 2😘 = 3😁 = 4😎 = 5🤪 = 6🥸 = 7😉 = 8🥰 = 9🥳 = 0",
                                     font: .systemFont(ofSize: 30, weight: .bold),
                                     color: .white,
                                     line: 10)
    
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    private let labelTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect //cтиль рамки
        textField.placeholder = "Укажите значение в формате 🥸🙂😂😁"
        textField.returnKeyType = .done
        textField.clearButtonMode = .always
        textField.keyboardType = .default
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let totalButton = UIButton(text: "Посчитать", tcolor: .white, color: UIColor.smilesButtonColor)
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupView()
        setConstraints()
    }
    
    //MARK: - Setup
    private func setupBackground() {
        view.backgroundColor = UIColor.smilesBackgroundColor
    }
    
    private func setupView() {
        title = "КАЛЬКУЛЯТОР СМАЙЛОВ"
        
        view.addSubview(smileLabel)
        view.addSubview(separatorView)
        view.addSubview(labelTextField)
        view.addSubview(totalButton)
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            smileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            smileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smileLabel.heightAnchor.constraint(equalToConstant: 200),
            smileLabel.widthAnchor.constraint(equalToConstant: 50),
            
            separatorView.topAnchor.constraint(equalTo: smileLabel.bottomAnchor, constant: 20),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            separatorView.heightAnchor.constraint(equalToConstant: 5),
            
            labelTextField.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            labelTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            labelTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            labelTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTextField.heightAnchor.constraint(equalToConstant: 50),
            
            totalButton.topAnchor.constraint(equalTo: labelTextField.bottomAnchor, constant: 20),
            totalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            totalButton.heightAnchor.constraint(equalToConstant: 75),
            totalButton.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
}

