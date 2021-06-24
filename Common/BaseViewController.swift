//
//  BaseViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-25.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let whiteColor: UIColor = .black
    private let blackColor: UIColor = .white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstrains()
        configureNavigationController()
        setGradientBackground()
    }
    
    func setupView() {}
    func setupConstrains() {}
}

extension BaseViewController {
    func setGradientBackground() {
        let colorTop =  whiteColor.cgColor
        let colorBottom = blackColor.cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [-0.2, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func configureNavigationController() {
        navigationController?.setNavigationBarHidden(true, animated: true)
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
