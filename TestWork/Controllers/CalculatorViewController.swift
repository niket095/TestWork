//
//  CalculatorViewController.swift
//  TestWork
//
//  Created by Nikita Putilov on 24.11.2024.
//

import UIKit

class CalculatorViewController: UIViewController{
    
    //MARK: - UI elements
    private let titleLabel = UILabel(text: "КАЛЬКУЛЯТОР СМАЙЛОВ",
                                     font: .systemFont(ofSize: 20, weight: .bold),
                                     color: .white,
                                     line: 1)
    
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
        textField.borderStyle = .roundedRect
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
    
    private let totalButton = UIButton(text: "Посчитать",
                                       colorBackground: UIColor.smilesButtonColor)
    
    private let backButton = UIButton(colorTint: .white,
                                      image: "x.circle.fill",
                                      colorBorder: UIColor.smilesBackgroundColor.cgColor)
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupView()
        setConstraints()
        setTarget()
    }
    
    //MARK: - Setup
    private func setupBackground() {
        view.backgroundColor = UIColor.smilesBackgroundColor
        view.alpha = 0.97
    }
    
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(smileLabel)
        view.addSubview(separatorView)
        view.addSubview(labelTextField)
        view.addSubview(totalButton)
        view.addSubview(backButton)
        
        labelTextField.delegate = self
    }
    
    func decodeSmiles(smiles: String) -> Int {
        var total = 0
        
        for char in smiles {
            switch char {
            case "🙂":
                total += 1
            case "😂":
                total += 2
            case "😘":
                total += 3
            case "😁":
                total += 4
            case "😎":
                total += 5
            case "🤪":
                total += 6
            case "🥸":
                total += 7
            case "😉":
                total += 8
            case "🥰":
                total += 9
            case "🥳":
                total += 0
            default:
                break
            }
        }
        return total
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            
            smileLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
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
//MARK: - Targets
extension CalculatorViewController{
    private func setTarget() {
        totalButton.addTarget(self, action: #selector(calculateTheAmount), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(backMainViewController), for: .touchUpInside)
    }
    
    @objc private func calculateTheAmount() {
        guard let inputText = labelTextField.text else { return }
        
        let sum = decodeSmiles(smiles: inputText)
        
        totalButton.setTitle("\(sum)", for: .normal)
    }
    
    @objc private func backMainViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - Extension textField
extension CalculatorViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.labelTextField.resignFirstResponder()
        return true
    }
}
