//
//  CoordinatorProtocol.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-16.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
