//
//  MainViewController.swift
//  TestWork
//
//  Created by Nikita Putilov on 18.11.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - UI elements
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let oneBackgroundImageView = UIImageView(image: Constants.Images.oneBackground,
                                                     contentMode: .scaleAspectFill)
    
    private let twoBackgroundImageView = UIImageView(image: Constants.Images.twoBackground,
                                                     contentMode: .scaleAspectFill)
    
    private let logoImageView = UIImageView(image: Constants.Images.logoImage,
                                            contentMode: .scaleAspectFit)
    
    private let tableButton = UIButton(text: "Go to TableView", color: .green)
    
    private let changeBackgroundButton = UIButton(text: "Change the Background", color: .brown)
    
    private let roundLogoButton = UIButton(text: "Round up the picture", color: .red)
    
    private let smilesCalculatorButton = UIButton(text: "Smile + Smile", color: .blue)
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
        setTargets()
    }
    
    //MARK: - Setup
    private func setupView() {
        title = "Главный экран"
        
        view.addSubview(oneBackgroundImageView)
        view.addSubview(twoBackgroundImageView)
        view.addSubview(scrollView)
        
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(tableButton)
        scrollView.addSubview(changeBackgroundButton)
        scrollView.addSubview(roundLogoButton)
        scrollView.addSubview(smilesCalculatorButton)
    }
    
    //MARK: - Constraints
    private func setConstraints() {
        backgroundImageView.frame = view.frame
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            firstLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstLabel.heightAnchor.constraint(equalToConstant: 200),
            firstLabel.widthAnchor.constraint(equalToConstant: 300),
            
            firstButton.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 20),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.heightAnchor.constraint(equalToConstant: 200),
            firstButton.widthAnchor.constraint(equalToConstant: 300),
            
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.heightAnchor.constraint(equalToConstant: 200),
            secondButton.widthAnchor.constraint(equalToConstant: 300),
            secondButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10)
        ])
    }
}


