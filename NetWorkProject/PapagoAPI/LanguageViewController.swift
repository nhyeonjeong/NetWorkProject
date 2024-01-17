//
//  LanguageViewController.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/17.
//

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet weak var languageTableView: UITableView!
    
    /// 언어 목록 ["ko" : "한국어"] 식으로 저장
    var languageDictionary: [String: String] = [:]
    
    var selectedLanguage: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for lan in Language.allCases {
            languageDictionary[lan.rawValue] = String(describing: lan)
        }
        configureView()
    }

    func configureView() {
        languageTableView.delegate = self
        languageTableView.dataSource = self

    }
}

extension LanguageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Language.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = languageTableView.dequeueReusableCell(withIdentifier: "languageTableViewCell")!
        let rawValue = Language.allCases[indexPath.row].rawValue
        if rawValue == selectedLanguage {
            cell.backgroundColor = .green
        } else {
            cell.backgroundColor = .clear
        }
        cell.textLabel?.text = languageDictionary[rawValue]
        return cell
    }
  
}
