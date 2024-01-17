//
//  Papago.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/17.
//

import Foundation
// Papago 뺴먹지 말기!
struct Papago: Codable {
    let message: Message
}

struct Message: Codable {
    let result: Result
}

struct Result: Codable {
    let srcLangType: String
    let tarLangType: String
    let translatedText: String
}
