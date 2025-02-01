//
//  AuthRepository.swift
//  DummyJSON
//
//  Created by Irham Naufal on 01/02/25.
//

import Foundation
import Moya

final class AuthRepository {
    
    private var provider: MoyaProvider<AuthTargetType>
    private var appState = AppState.shared
    
    init(provider: MoyaProvider<AuthTargetType> = .defaultProvider()) {
        self.provider = provider
    }
    
    func login(_ body: LoginRequest) async -> Result<LoginResponse, Error> {
        do {
            let response = try await provider.requestAsync(.login(body), model: LoginResponse.self)
            appState.login(response)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
    
    func getMe() async -> Result<UserResponse, Error> {
        do {
            let response = try await provider.requestAsync(.getMe, model: UserResponse.self)
            return .success(response)
        } catch {
            return .failure(error)
        }
    }
}
