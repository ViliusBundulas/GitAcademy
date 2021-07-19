//
//  BaseViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-25.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstrains()
        configureNavigationController()
        view.backgroundColor = #colorLiteral(red: 0.1098039216, green: 0.1176470588, blue: 0.137254902, alpha: 1)
    }
    
    func setupView() {}
    func setupConstrains() {}
}

extension BaseViewController {
    
    func configureNavigationController() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
