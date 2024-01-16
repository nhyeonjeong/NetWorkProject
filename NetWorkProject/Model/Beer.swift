//
//  Beer.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/17.
//

import Foundation

struct Beer: Codable {
    let name: String
    let description: String
    let image_url: String? // nil일 수 있음
}

