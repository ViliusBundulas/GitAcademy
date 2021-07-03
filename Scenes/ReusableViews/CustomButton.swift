//
//  CustomButton.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-25.
//

import UIKit
import SnapKit

class CustomButton: BaseView {
    
    //MARK: UI elements
    
    let button: UIButton
    
    init(text: String? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil, buttonAlpha: CGFloat? = nil, textColor: UIColor? = nil, target: Any? = nil, action: Selector? = nil, controlEvent: UIControl.Event) {
        button = UIButton(type: .system)
        button.tintColor = textColor
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius ?? 25
        button.alpha = buttonAlpha ?? 1
        button.addTarget(target, action: action!, for: controlEvent)
        button.setTitle(text, for: .normal)
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup views
    
    override func setupView() {
        super.setupView()
        
        self.addSubview(button)
    }
    
    //MARK: - Setup constrains
    
    override func setupConstrains() {
        super.setupConstrains()
        
        button.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(self)
        }
    }
}
