//
//  BaseView.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-25.
//

import UIKit

class BaseView: UIView {
    init() {
        super.init(frame: .zero)
        
        setupView()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
        setupConstrains()
    }
    
    func setupView() {}
    func setupConstrains() {}
}
