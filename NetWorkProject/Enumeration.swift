//
//  Enumeration.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/17.
//

import Foundation

enum Language: String {
    case 한국어 = "ko"
    case 영어 = "en"
    case 일본어 = "ja"
    case 중국어간체 = "zh-CN"
    case 중국어번체 = "zh-TW"
    case 베트남어 = "vi"
    case 인도네시아어 = "id"
    case 태국어 = "th"
    case 독일어 = "de"
    case 러시아어 = "ru"
    case 스페인어 = "es"
    case 이탈리아어 = "it"
    case 프랑스어 = "fr"
    
    func languageString() -> String {
        return String(describing: self) // 우와!!!
    }
    
}


