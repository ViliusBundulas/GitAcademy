//
//  DependencyContainer.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-18.
//

import Foundation

class DependencyContainer {
    lazy var gitApiManager = GitAPIManager()
    lazy var tokenManager = TokenManager()
}

