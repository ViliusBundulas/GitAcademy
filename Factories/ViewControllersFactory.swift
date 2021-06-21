//
//  ViewControllersFactory.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-18.
//

import Foundation

protocol ViewControllersFactory {
    func makeTestViewController() -> TestViewController
}

extension DependencyContainer: ViewControllersFactory {
    func makeTestViewController() -> TestViewController {
        return TestViewController()
    }
    
    
}
