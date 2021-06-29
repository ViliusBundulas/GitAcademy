//
//  TestViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-20.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var button: UIButton = {
        let buttone = UIButton()
        buttone.titleLabel?.text = "Press"
        buttone.backgroundColor = .yellow
        buttone.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return buttone
    }()
    
    @objc func buttonPressed() {
        viewModel.getUserData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        view.addSubview(button)
        setupConstrains()
    }
    
    func setupConstrains() {
        button.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.centerX.centerX.equalTo(view)
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        viewModel.getUserData()
//    }
}
