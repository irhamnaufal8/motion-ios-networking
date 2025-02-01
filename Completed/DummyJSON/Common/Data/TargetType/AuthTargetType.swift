//
//  AuthTargetType.swift
//  DummyJSON
//
//  Created by Irham Naufal on 01/02/25.
//

import Foundation
import Moya

enum AuthTargetType {
    case login(LoginRequest)
    case getMe
}

extension AuthTargetType: DefaultTargetType, AccessTokenAuthorizable {
    
    var authorizationType: Moya.AuthorizationType? {
        switch self {
        case .login:
            return .none
        case .getMe:
            return .bearer
        }
    }
    
    var path: String {
        switch self {
        case .login:
            "/auth/login"
        case .getMe:
            "/auth/me"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .getMe:
            return .get
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .login(let loginRequest):
            return loginRequest.toJSON()
        case .getMe:
            return [:]
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .login:
            return JSONEncoding.default
        case .getMe:
            return URLEncoding.default
        }
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
}
