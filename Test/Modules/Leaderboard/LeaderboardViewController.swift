//
//  LeaderboardViewController.swift
//  Test
//
//  Created by Abdulkadir Oruç on 20.04.2025.
//

import UIKit

protocol LeaderboardViewInterface{
    
}

class LeaderboardViewController: UIViewController {
    
    private let dailyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Daily", for: .normal)
        button.backgroundColor = UIColor(hex: Constants.Colors.lightPeach, alpha: 1)
        button.layer.cornerRadius = 17
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.setTitleColor(UIColor(hex: Constants.Colors.darkGray, alpha: 1), for: .normal)
        return button
    }()
    
    private let weeklyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Weekly", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = .systemFont(ofSize: 17)
        return button
    }()
    
    private let monthlyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Monthly", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 16
        button.titleLabel?.font = .systemFont(ofSize: 17)
        return button
    }()
    
    private let toggleStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        stack.layer.cornerRadius = 20
        stack.backgroundColor = UIColor(hex: Constants.Colors.lightOrange)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let stateView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: Constants.Colors.babyBlue, alpha: 1)
        return view
    }()
    
    private let stateRankLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 20
        label.clipsToBounds = true
        label.font = .systemFont(ofSize: 20)
        label.backgroundColor = UIColor(hex: Constants.Colors.lightOrange, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 2
        return label
    }()
    
    private let firstProfileImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 35
        iv.backgroundColor = .black
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor(hex: Constants.Colors.lightOrange, alpha: 1)
        return iv
    }()
    
    private let firstProfileLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(hex: Constants.Colors.darkGray, alpha: 1)
        return label
    }()
    
    private let firstProfileTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.backgroundColor = UIColor(hex: Constants.Colors.softOrange, alpha: 1)
        label.textColor = .white
        return label
    }()
    
    private let crownIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "crown")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let secondProfileImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 35
        iv.backgroundColor = .black
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor(hex: Constants.Colors.lightOrange, alpha: 1)
        return iv
    }()
    
    private let secondProfileLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(hex: Constants.Colors.darkGray, alpha: 1)
        return label
    }()
    
    private let secondProfileTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.backgroundColor = UIColor(hex: Constants.Colors.softOrange, alpha: 1)
        label.textColor = .white
        return label
    }()
    
    private let thirdProfileImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 35
        iv.backgroundColor = .black
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = UIColor(hex: Constants.Colors.lightOrange, alpha: 1)
        return iv
    }()
    
    private let thirdProfileLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = UIColor(hex: Constants.Colors.darkGray, alpha: 1)
        return label
    }()
    
    private let thirdProfileTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.layer.cornerRadius = 15
        label.clipsToBounds = true
        label.backgroundColor = UIColor(hex: Constants.Colors.softOrange, alpha: 1)
        label.textColor = .white
        return label
    }()
    
    private let podiumIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "podium")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        showSheet()
        
        stateRankLabel.text = "#1"
        stateLabel.text = "You are doing better than 60% of your friends!"
        firstProfileLabel.text = "Abdulkadir Oruç"
        firstProfileTimeLabel.text = "07H 15M"
        secondProfileLabel.text = "Abdulkadir Oruç"
        secondProfileTimeLabel.text = "0H 02M"
        thirdProfileLabel.text = "Abdulkadir Oruç"
        thirdProfileTimeLabel.text = "07H 15M"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.setGradientBackground(colors: [UIColor(hex: Constants.Colors.lightPeach), .white])
    }
    
    func setupView(){
        tabBarController?.tabBar.backgroundColor = .white
        let searchBarButtonItem = UIBarButtonItem(image: UIImage(systemName: Constants.Icons.magnifyingglassCircleFill), style: .plain, target: self, action: #selector(searchBarButtonItemTapped))
        searchBarButtonItem.tintColor = .black
        navigationItem.rightBarButtonItem = searchBarButtonItem
        
        
        toggleStack.addArrangedSubview(dailyButton)
        toggleStack.addArrangedSubview(weeklyButton)
        toggleStack.addArrangedSubview(monthlyButton)

        view.addSubview(toggleStack)
        view.addSubview(stateView)
        stateView.addSubview(stateRankLabel)
        stateView.addSubview(stateLabel)
        view.addSubview(firstProfileImageView)
        view.addSubview(firstProfileLabel)
        view.addSubview(firstProfileTimeLabel)
        view.addSubview(crownIconImageView)
        view.addSubview(secondProfileImageView)
        view.addSubview(secondProfileLabel)
        view.addSubview(secondProfileTimeLabel)
        view.addSubview(thirdProfileImageView)
        view.addSubview(thirdProfileLabel)
        view.addSubview(thirdProfileTimeLabel)
        view.addSubview(podiumIconImageView)
        
        NSLayoutConstraint.activate([
            dailyButton.heightAnchor.constraint(equalToConstant: 42),
            weeklyButton.heightAnchor.constraint(equalToConstant: 42),
            monthlyButton.heightAnchor.constraint(equalToConstant: 42),
            
            toggleStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            toggleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            toggleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            
            stateView.topAnchor.constraint(equalTo: toggleStack.bottomAnchor, constant: 15),
            stateView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            stateView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            stateView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
            
            stateRankLabel.centerYAnchor.constraint(equalTo: stateView.centerYAnchor),
            stateRankLabel.leadingAnchor.constraint(equalTo: stateView.leadingAnchor, constant: 20),
            stateRankLabel.heightAnchor.constraint(equalToConstant: 50),
            stateRankLabel.widthAnchor.constraint(equalToConstant: 50),
            
            stateLabel.centerYAnchor.constraint(equalTo: stateView.centerYAnchor),
            stateLabel.leadingAnchor.constraint(equalTo: stateRankLabel.trailingAnchor, constant: 20),
            stateLabel.trailingAnchor.constraint(equalTo: stateView.trailingAnchor, constant: -20),
            
            
            firstProfileImageView.topAnchor.constraint(equalTo: stateView.bottomAnchor, constant: 30),
            firstProfileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstProfileImageView.widthAnchor.constraint(equalToConstant: 70),
            firstProfileImageView.heightAnchor.constraint(equalToConstant: 70),
            
            crownIconImageView.topAnchor.constraint(equalTo: firstProfileImageView.topAnchor,constant: -25),
            crownIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            crownIconImageView.widthAnchor.constraint(equalToConstant: 50),
            crownIconImageView.heightAnchor.constraint(equalToConstant: 50),
            
            
            firstProfileLabel.topAnchor.constraint(equalTo: firstProfileImageView.bottomAnchor, constant: 15),
            firstProfileLabel.centerXAnchor.constraint(equalTo: firstProfileImageView.centerXAnchor),
            firstProfileLabel.widthAnchor.constraint(equalToConstant: 100),
            firstProfileLabel.heightAnchor.constraint(equalToConstant: 45),
            
            firstProfileTimeLabel.topAnchor.constraint(equalTo: firstProfileLabel.bottomAnchor, constant: 10),
            firstProfileTimeLabel.centerXAnchor.constraint(equalTo: firstProfileLabel.centerXAnchor),
            firstProfileTimeLabel.widthAnchor.constraint(equalToConstant: 70),
            firstProfileTimeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            secondProfileImageView.topAnchor.constraint(equalTo: firstProfileImageView.centerYAnchor),
            secondProfileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            secondProfileImageView.widthAnchor.constraint(equalToConstant: 70),
            secondProfileImageView.heightAnchor.constraint(equalToConstant: 70),
            
            secondProfileLabel.topAnchor.constraint(equalTo: secondProfileImageView.bottomAnchor, constant: 15),
            secondProfileLabel.centerXAnchor.constraint(equalTo: secondProfileImageView.centerXAnchor),
            secondProfileLabel.widthAnchor.constraint(equalToConstant: 100),
            secondProfileLabel.heightAnchor.constraint(equalToConstant: 45),
            
            secondProfileTimeLabel.topAnchor.constraint(equalTo: secondProfileLabel.bottomAnchor, constant: 10),
            secondProfileTimeLabel.centerXAnchor.constraint(equalTo: secondProfileLabel.centerXAnchor),
            secondProfileTimeLabel.widthAnchor.constraint(equalToConstant: 70),
            secondProfileTimeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            thirdProfileImageView.topAnchor.constraint(equalTo: firstProfileImageView.bottomAnchor),
            thirdProfileImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
            thirdProfileImageView.widthAnchor.constraint(equalToConstant: 70),
            thirdProfileImageView.heightAnchor.constraint(equalToConstant: 70),
            
            thirdProfileLabel.topAnchor.constraint(equalTo: thirdProfileImageView.bottomAnchor, constant: 15),
            thirdProfileLabel.centerXAnchor.constraint(equalTo: thirdProfileImageView.centerXAnchor),
            thirdProfileLabel.widthAnchor.constraint(equalToConstant: 100),
            thirdProfileLabel.heightAnchor.constraint(equalToConstant: 45),
            
            thirdProfileTimeLabel.topAnchor.constraint(equalTo: thirdProfileLabel.bottomAnchor, constant: 10),
            thirdProfileTimeLabel.centerXAnchor.constraint(equalTo: thirdProfileLabel.centerXAnchor),
            thirdProfileTimeLabel.widthAnchor.constraint(equalToConstant: 70),
            thirdProfileTimeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            podiumIconImageView.topAnchor.constraint(equalTo: firstProfileTimeLabel.bottomAnchor, constant: 20),
            podiumIconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            podiumIconImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            podiumIconImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            podiumIconImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
            
            
            
        ])
        
        dailyButton.addTarget(self, action: #selector(dailyButtonTapped), for: .touchUpInside)
        weeklyButton.addTarget(self, action: #selector(weeklyButtonTapped), for: .touchUpInside)
        monthlyButton.addTarget(self, action: #selector(monthlyButtonTapped), for: .touchUpInside)
    }

    
    @objc func dailyButtonTapped() {
        dailyButton.backgroundColor = UIColor(hex: Constants.Colors.lightPeach)
        dailyButton.setTitleColor(UIColor(hex: Constants.Colors.darkGray, alpha: 1), for: .normal)
        weeklyButton.backgroundColor = .clear
        weeklyButton.setTitleColor(.white, for: .normal)
        monthlyButton.backgroundColor = .clear
        monthlyButton.setTitleColor(.white, for: .normal)
    }
    
    
    @objc func weeklyButtonTapped() {
        weeklyButton.backgroundColor = UIColor(hex: Constants.Colors.lightPeach)
        weeklyButton.setTitleColor(UIColor(hex: Constants.Colors.darkGray, alpha: 1), for: .normal)
        dailyButton.backgroundColor = .clear
        dailyButton.setTitleColor(.white, for: .normal)
        monthlyButton.backgroundColor = .clear
        monthlyButton.setTitleColor(.white, for: .normal)
    }
    
    @objc func monthlyButtonTapped() {
        monthlyButton.backgroundColor = UIColor(hex: Constants.Colors.lightPeach)
        monthlyButton.setTitleColor(UIColor(hex: Constants.Colors.darkGray, alpha: 1), for: .normal)
        dailyButton.backgroundColor = .clear
        dailyButton.setTitleColor(.white, for: .normal)
        weeklyButton.backgroundColor = .clear
        weeklyButton.setTitleColor(.white, for: .normal)
    }
    
    @objc private func showSheet() {
        let sheetVC = BottomSheetViewController()
        
        // Add as child
        addChild(sheetVC)
        view.addSubview(sheetVC.view)
        sheetVC.didMove(toParent: self)
        
        // Layout
        NSLayoutConstraint.activate([
            sheetVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            sheetVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            sheetVC.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.73),
            sheetVC.view.topAnchor.constraint(equalTo: podiumIconImageView.bottomAnchor, constant: -30)
        ])
    }
    
    @objc func searchBarButtonItemTapped(){
        navigationController?.pushViewController(ProfileSearchViewController(), animated: true)
    }
}


#Preview("LeaderboardViewController"){
    LeaderboardViewController()
}

