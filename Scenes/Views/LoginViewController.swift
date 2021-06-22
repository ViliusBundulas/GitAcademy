//
//  LoginViewController.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-15.
//

import UIKit
import AuthenticationServices

struct TokenBag {
    let accessToken: String
}

class LoginViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // Use the URL and callback scheme specified by the authorization provider.
            guard let authURL = URL(string: "https://github.com/login/oauth/authorize?client_id=Iv1.25694f93f3fe6645") else { return }
            let scheme = "gitacademyviliusbundulas"

            // Initialize the session.
            let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: scheme)
            { callbackURL, error in
                // Handle the callback.
                guard error == nil, let callbackURL = callbackURL else { return }

                // The callback URL format depends on the provider. For this example:
                //   exampleauth://auth?token=1234
                let components = URLComponents(string: callbackURL.absoluteString)?.queryItems
                let code = components?.filter({ $0.name == "code" }).first?.value
                
                guard let authCode = code else { return }
                
                
                
                print(authCode)
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
