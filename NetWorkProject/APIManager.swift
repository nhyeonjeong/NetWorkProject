//
//  APIManager.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/17.
//

import Foundation
import Alamofire

struct APIManager {
    static var url = ""
 
}

// 로또
extension APIManager {
    
    //    var url: String = "" -> ?밖으로 빼주면 안되는 이유?

    /// 로또번호
    func callRequest(round: String, completionHandler: @escaping (Lotto) -> Void) { // 배열을 전달해줄수도 있음
        
        APIManager.url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)"
        
        AF.request(APIManager.url, method: .get).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let success):
                
                print(success)
                
                //                let lottoNumberList = saveNumber(data: success)
                completionHandler(success)
                
            case .failure(let failure):
                print("오류 : \(failure)")
            }
        }
    }
    
    /// 7개읭 숫자를 String타입으로 저장
    func saveNumber(data: Lotto) -> [Int] {
        return [data.drwtNo1, data.drwtNo2, data.drwtNo3, data.drwtNo4, data.drwtNo5, data.drwtNo6, data.bnusNo]
        
    }
}

// 랜덤 맥주
extension APIManager {
    func beearRequest(completionHandler: @escaping (Beer) -> Void) {
        
        APIManager.url = "https://api.punkapi.com/v2/beers/random"
        
        AF.request(APIManager.url, method: .get).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let success):
                
                print(success)
                
                completionHandler(success[0])
                
            case .failure(let failure):
                print("오류 : \(failure)")
            }
        }
    }
}

// 파파고 번역 APIManager
extension APIManager {
    func papagoRequest(bodyData: Parameters, completionHandler: @escaping (Result) -> Void) {
        
        APIManager.url = "https://openapi.naver.com/v1/papago/n2mt"
        
        AF.request(APIManager.url, method: .post, parameters: bodyData).responseDecodable(of: Message.self) { response in
            switch response.result {
            case .success(let success):
                
                print(success)
                completionHandler(success.result)
                
            case .failure(let failure):
                print("오류 : \(failure)")
            }
        }
        
    }
}
