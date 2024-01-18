//
//  Book.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/17.
//

import Foundation

// MARK: - Book
struct Book: Codable {
    let documents: [Document]
//    let meta: Meta
}

// MARK: - Document
struct Document: Codable {
//    let authors: [String]
//    let contents, datetime, isbn: String
//    let price: Int
//    let publisher: String
    let salePrice: Int?
//    let status: Status
    let thumbnail: String
    let title: String
//    let translators: [JSONAny] // 이슈가 생길 수 있음.->사용하지 않는 것으로..
//    let url: String

//    enum CodingKeys: String, CodingKey {
//        case authors, contents, datetime, isbn, price, publisher
//        case salePrice = "sale_price"
//        case /*status,*/ thumbnail, title/*, translators*/, url
//    }
}

// MARK: - Meta
struct Meta: Codable {
//    let isEnd: Bool
//    let pageableCount, totalCount: Int

//    enum CodingKeys: String, CodingKey {
//        case isEnd = "is_end"
//        case pageableCount = "pageable_count"
//        case totalCount = "total_count"
//    }
}
