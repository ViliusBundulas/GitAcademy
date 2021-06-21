//
//  LoginViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-15.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            // Use the URL and callback scheme specified by the authorization provider.
            guard let authURL = URL(string: "https://github.com/login/oauth/authorize") else { return }
            let scheme = "testas"

            // Initialize the session.
            let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: scheme)
            { callbackURL, error in
                // Handle the callback.
                guard error == nil, let callbackURL = callbackURL else { return }

                // The callback URL format depends on the provider. For this example:
                //   exampleauth://auth?token=1234
                let queryItems = URLComponents(string: callbackURL.absoluteString)?.queryItems
                let token = queryItems?.filter({ $0.name == "token" }).first?.value
                
                print(callbackURL)
            }
            
            session.presentationContextProvider = self
            session.start()
//            self.coordinator?.startTestViewController()
            }
    }
}

extension LoginViewController: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
}
