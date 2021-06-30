//
//  SignInViewModel.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-23.
//

import UIKit
import AuthenticationServices

class LoginViewModel: NSObject, ObservableObject {
    
    private let gitApiManager: GitAPIManager
    
    init(gitApiManager: GitAPIManager) {
        self.gitApiManager = gitApiManager
    }
    
    var items = Observable<UserData?>(nil)
    var isLoading = Observable<Bool>(false)
    
    var onDismiss: (() -> Void)?
    
    func getGitHubIdentity() {
        self.isLoading.value = true
        
        var authorizeURLComponents = URLComponents(string: GitHubConstants.authorizeURL)
        authorizeURLComponents?.queryItems = [
            URLQueryItem(name: "client_id", value: GitHubConstants.clientID),
            URLQueryItem(name: "scope", value: GitHubConstants.scope)
        ]
        
        guard let authorizeURL = authorizeURLComponents?.url else {
            print("Could not create the sign in URL.")
            return
        }
        
        let callbackURLScheme = GitHubConstants.redirectURI
        
        let authenticationSession = ASWebAuthenticationSession(
            url: authorizeURL,
            callbackURLScheme: callbackURLScheme) { callbackURL, error in
            guard
                error == nil,
                let successURL = callbackURL
            else {
                return
            }
            
            guard let accessCode = URLComponents(string: (successURL.absoluteString))?
                    .queryItems?.first(where: { $0.name == "code" }) else {
                return
            }
            
            guard let value = accessCode.value else {
                return
            }
            
            self.gitApiManager.fetchAccessToken(accessCode: value) { result in
                switch result {
                case .success:
                    print("Successfully fetched access token")
                    guard let token = TokenManager.shared.fetchAccessToken() else { return }
                    print("This is our token \(token)")
                    self.isLoading.value = false
                    self.onDismiss?()
                case .failure:
                    print("Error getching access token")
                }
            }
        }
        
        authenticationSession.presentationContextProvider = self
        authenticationSession.start()
    }
    
    func getUserData() {
        self.gitApiManager.fetchUserData { result in
            switch result {
            case .success(let result):
                self.items.value = result
                print("successully got user data: \(String(describing: self.items.value))")
            case .failure:
                print("failed to get user data")
            }
        }
    }
}

extension LoginViewModel: ASWebAuthenticationPresentationContextProviding {
  func presentationAnchor(for session: ASWebAuthenticationSession)
  -> ASPresentationAnchor {
    let window = UIApplication.shared.windows.first { $0.isKeyWindow }
    return window ?? ASPresentationAnchor()
  }
}
