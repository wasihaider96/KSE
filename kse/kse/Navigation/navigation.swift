//
//  navigation.swift
//  kse
//
//  Created by Dev ILI on 12/08/2021.
//

import UIKit

enum BarButtonType {
    case Menu
    case Login
}

class AppNavigation: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Variables
    private var clickHandler: ((Int) -> Void)?
    private var type: BarButtonType = .Login
    let menubtn = UIButton(type: .system)
    
    lazy var menuBarItem: Array = { () -> [UIBarButtonItem] in
        menubtn.backgroundColor = .clear
        menubtn.tintColor = .white
        menubtn.setImage(UIImage(named: "Image.png"), for: .normal)
        menubtn.addTarget(self, action: #selector(classBtnTapped), for: .touchUpInside)
        menubtn.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        menubtn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let menuBarButton = UIBarButtonItem(customView: menubtn)
        return [menuBarButton]
    }()
    
    let loginbtn = UIButton(type: .system)
    lazy var loginBarItem: Array = { () -> [UIBarButtonItem] in
        loginbtn.backgroundColor = .white
        loginbtn.tintColor = .clear
        loginbtn.titleLabel?.font = .systemFont(ofSize: 22)
        loginbtn.setTitleColor(.black, for: .normal)
        loginbtn.setTitle("Login", for: .normal)
        loginbtn.addTarget(self, action: #selector(classBtnTapped), for: .touchUpInside)
        loginbtn.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        loginbtn.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        loginbtn.layer.cornerRadius = 23.0
        
        let clasBarButton = UIBarButtonItem(customView: loginbtn)
        return [clasBarButton]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupNavigation()
        
        
        self.navigationItem.setLeftBarButtonItems(self.menuBarItem, animated: true)
        self.navigationItem.setRightBarButtonItems(self.loginBarItem, animated: true)
    }
    @objc func action(sender: UIBarButtonItem) {
        // Function body goes here
    }
    
    // MARK: - Navigation / IBActions
    @objc func classBtnTapped() {
        guard let completion = self.clickHandler else {return}
                
        switch type {
        case .Menu:
            completion(0)
            break
        case .Login:
            completion(1)
            break
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    // MARK: - Custom Funtions
    private func setupNavigation() {
        // Navigation Settings
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.3610317027, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    func watchForClickHandler(completion: @escaping (Int) -> Void) {
        self.clickHandler = completion
    }
}
