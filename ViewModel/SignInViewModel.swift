//
//  SignInViewModel.swift
//  GitAcademy
//
//  Created by Vilius Bundulas on 2021-06-23.
//

import UIKit
import AuthenticationServices

class SignInViewModel: NSObject, ObservableObject {
    
    
    func getGitHubIdentity() {
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
            
            GitAPIManager.shared.fetchAccessToken(accessCode: value) { isSuccess in
                if !isSuccess {
                    print("Error getching access token")
                }
            }
        }
        
        authenticationSession.presentationContextProvider = self
        authenticationSession.start()
    }
}

extension SignInViewModel: ASWebAuthenticationPresentationContextProviding {
  func presentationAnchor(for session: ASWebAuthenticationSession)
  -> ASPresentationAnchor {
    let window = UIApplication.shared.windows.first { $0.isKeyWindow }
    return window ?? ASPresentationAnchor()
  }
}
