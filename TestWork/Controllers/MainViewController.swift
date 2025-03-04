//
//  MainViewController.swift
//  TestWork
//
//  Created by Nikita Putilov on 18.11.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - UI elements
    private var backgroundImageFlag = false
    private var cornerRadiusFlag = false
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let backgroundImage = UIImageView(image: Constants.Images.oneBackground)
    
    private let logoImageView = UIImageView(image: Constants.Images.logoImage,
                                            contentMode: .scaleAspectFill,
                                            borderColor: UIColor.white.cgColor,
                                            cornerRadius: 20,
                                            borderWidth: 5)
    
    private let tableButton = UIButton(text: "Go to TableView",
                                       colorBackground: UIColor.tableButtonColor)
    
    private let changeBackgroundButton = UIButton(text: "Change the Background",
                                                  colorBackground: UIColor.changeBackgroundButtonColor)
    
    private let roundLogoButton = UIButton(text: "Round up the picture",
                                           colorBackground: UIColor.roundLogoButtonColor)
    
    private let smilesCalculatorButton = UIButton(text: "Smile + Smile",
                                                  colorBackground: UIColor.smilesCalculatorButtonColor)
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        setTargets()
        
        backgroundImage.frame = view.bounds
    }
    
    //MARK: - Setup
    private func setupView() {
        view.addSubview(backgroundImage)
        view.addSubview(scrollView)
        
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(tableButton)
        scrollView.addSubview(changeBackgroundButton)
        scrollView.addSubview(roundLogoButton)
        scrollView.addSubview(smilesCalculatorButton)
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 250),
            logoImageView.widthAnchor.constraint(equalToConstant: 250),
            
            tableButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            tableButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableButton.heightAnchor.constraint(equalToConstant: 75),
            tableButton.widthAnchor.constraint(equalToConstant: 250),
            
            changeBackgroundButton.topAnchor.constraint(equalTo: tableButton.bottomAnchor, constant: 20),
            changeBackgroundButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeBackgroundButton.heightAnchor.constraint(equalToConstant: 75),
            changeBackgroundButton.widthAnchor.constraint(equalToConstant: 250),
            
            roundLogoButton.topAnchor.constraint(equalTo: changeBackgroundButton.bottomAnchor, constant: 20),
            roundLogoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundLogoButton.heightAnchor.constraint(equalToConstant: 75),
            roundLogoButton.widthAnchor.constraint(equalToConstant: 250),
            
            smilesCalculatorButton.topAnchor.constraint(equalTo: roundLogoButton.bottomAnchor, constant: 20),
            smilesCalculatorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smilesCalculatorButton.heightAnchor.constraint(equalToConstant: 75),
            smilesCalculatorButton.widthAnchor.constraint(equalToConstant: 250),
            smilesCalculatorButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
    }
}
//MARK: - Targets
extension MainViewController {
    private func setTargets() {
        tableButton.addTarget(self, action: #selector(clickToGoVCTable), for: .touchUpInside)
        changeBackgroundButton.addTarget(self, action: #selector(changeBackground), for: .touchUpInside)
        roundLogoButton.addTarget(self, action: #selector(roundButtonAction), for: .touchUpInside)
        smilesCalculatorButton.addTarget(self, action: #selector(clickToGoVCCalculator), for: .touchUpInside)
    }
    
    @objc private func clickToGoVCTable() {
        let vc = TableViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func changeBackground() {
        backgroundImageFlag.toggle()
        backgroundImage.image = UIImage(named: backgroundImageFlag == false ? Constants.Images.oneBackground : Constants.Images.twoBackground)
    }
    
    @objc private func roundButtonAction(sender: UIButton) {
        cornerRadiusFlag.toggle()
        logoImageView.layer.cornerRadius = cornerRadiusFlag ? logoImageView.frame.size.width / 2 : 20
    }
    
    @objc private func clickToGoVCCalculator() {
        let calculatorVC = CalculatorViewController()
        present(calculatorVC, animated: true, completion: nil)
    }
}
