//
//  Constants.swift
//  TesteIOSV2-1
//
//  Created by Paulo Danilo Conceição Lima on 22/05/22.
//

import Foundation

struct Constants {
    
    static let FailLogin = "login ou senha incorretos, favor verificar"
    static let SucessLogin = "Login Feito com Sucesso"
    static let FillLogin = "Favor preencha o campo de Login"
    static let FillPassword = "Favor preencha o campo de senha"
    static let FillLoginAndPassword = "Favor preencha o campo de login e senha"
    static let PasswordNumber = "A senha não possui Caracteres Alfa alfanumérico"
    static let PasswordEspecials = "A senha não possui Caracteres Espaciais"
    static let PasswordUppercase = "A senha não possui Caracteres Maiusculos"
    
    struct API {
        static let BaseURL = "https://60bd336db8ab3700175a03b3.mockapi.io"
    }
    
    struct Dashboard {
        
        
        struct TableView {
            static let heigth = 110.0
            static let headerHeigth = 60.0
        }
        
        
    }
}
