//
//  PapagoMainViewController.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/17.
//

import UIKit
import Alamofire

class PapagoMainViewController: UIViewController {

    @IBOutlet weak var leftLanguageButton: UIButton!
    @IBOutlet weak var rightLanguageButton: UIButton!
    
    @IBOutlet weak var changeLanButton: UIButton!
    @IBOutlet weak var translateButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var translateLabel: UILabel!
    
    // 맨 처음 세팅은 한국어 -> 영어 번역
    var leftLanguage = Language.한국어
    var rightLanguage = Language.영어
    
    let apiManager = APIManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        
        
    }
    
    @IBAction func changeLanButtonClicked(_ sender: UIButton) {
        // 왼쪽 오른쪽 언어 바꾸기
        let tempLan = leftLanguage
        leftLanguage = rightLanguage
        rightLanguage = tempLan
        
        settingButtonLanguageTitle(left: leftLanguage, right: rightLanguage) // 버튼다시 설정
        
    }
    // 번역 버튼 눌렀을 때
    @IBAction func translateButtonClicked(_ sender: UIButton) {
        let source = leftLanguage.rawValue
        let target = rightLanguage.rawValue
        // 공백 : whitespace추후 고려....후..
        if textView.text! == "" {
            translateLabel.text = "번역할 문장이나 단어를 입력해주세요.."
            return
        }
        /*
        guard let source, let target else {
            print("source, target중 nil이 있습니다!")
            return
        }
        */
        let headers: HTTPHeaders = ["X-Naver-Client-Id": APIKey.clientID,
                                    "X-Naver-Client-Secret": APIKey.clientSecret]
        
        let parameters: Parameters = ["source": source,
                                      "target": target,
                                      "text": textView.text!]
        
        apiManager.papagoRequest(headerData: headers, bodyData: parameters) { result in
            self.translateLabel.text = result.translatedText // 번역한 문장 띄우기
            
        }/*한국어*/
    }
    
    /// 언어에 따라 버튼의 title을 설정하는 함수
    func settingButtonLanguageTitle(left: Language, right: Language) {
        leftLanguageButton.setTitle(left.languageString(), for: .normal)
        rightLanguageButton.setTitle(right.languageString(), for: .normal)
    }
    
//    function configureView() {
//        
//    }
    
}

extension PapagoMainViewController {
    // UI
    func settingView() {
        
        navigationItem.title = "Papago"
        
        settingButtonLanguageTitle(left: Language.한국어, right: Language.영어)
        
        leftLanguageButton.layer.cornerRadius = 10
        leftLanguageButton.layer.borderWidth = 1
        leftLanguageButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        rightLanguageButton.layer.cornerRadius = 10
        rightLanguageButton.layer.borderWidth = 1
        rightLanguageButton.layer.borderColor = UIColor.systemBlue.cgColor
        
        changeLanButton.layer.cornerRadius = 10
        changeLanButton.backgroundColor = .systemBlue
        changeLanButton.setImage(UIImage(systemName: "arrow.right.arrow.left.circle"), for: .normal)
        changeLanButton.tintColor = .white
        
        translateButton.setTitleColor(.white, for: .normal)
        translateButton.setTitle("번역하기", for: .normal)
        translateButton.backgroundColor = .systemBlue
        translateButton.layer.cornerRadius = 10
        translateButton.clipsToBounds = true
        
        translateLabel.numberOfLines = 0
    }
    
}
