//
//  LotteryViewController.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/16.
//

import UIKit

class LotteryViewController: UIViewController {

    @IBOutlet weak var roundTextField: UITextField!
    @IBOutlet var numberImageViews: [UIImageView]!
    
    @IBOutlet weak var lottoDateLabel: UILabel!
    @IBOutlet weak var roundPickerView: UIPickerView!
    
    let lottoAPIManager = LottoAPIManager()
    
    var numList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingView()
        requestSettingData(round: "1102")
        
    }
    
//    @IBAction func returnTapped(_ sender: UITextField) {
//        requestSettingData(round: sender.text!)
//    }
//    
//    @IBAction func textFieldTouched(_ sender: UITextField) {
//        print(#function)
//        roundPickerView.isHidden = false
//    }
    /// 데이터 세팅(로또번호와 날짜 라벨)
    func configureView(data: Lotto) {
        
        numList = [data.drwtNo1, data.drwtNo2, data.drwtNo3, data.drwtNo4, data.drwtNo5, data.drwtNo6, data.bnusNo]
        
        for i in 0..<numList.count {
            numberImageViews[i].image = UIImage(systemName: "\(numList[i]).square")
        }
        
        lottoDateLabel.text = "\(DateFormatter.changeDateFormatter(dateString: data.drwNoDate, newDateFormat: "yyyy년 M년 d일"))의 로또번호입니다!"
        
    }
    
    /// alamofire request하는 함수
    func requestSettingData(round: String) {
        lottoAPIManager.callRequest(round: round) { lottoData in
            self.configureView(data: lottoData)

        }
    }
    
}

extension LotteryViewController {
    /// 디자인
    func settingView() {
        roundPickerView.isHidden = true
//        
//        roundPickerView.delegate = self
//        roundPickerView.dataSource = self
//        
        roundTextField.placeholder = "로또 회차를 입력해주세요"
        
        for item in numberImageViews {
            item.tintColor = .orange
        }
        lottoDateLabel.font = .boldSystemFont(ofSize: 15)
        lottoDateLabel.textAlignment = .center
        
    }
}

//extension LotteryViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 1102
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        roundTextField.text = "\(component)"
//    }
//    
//    
//    
//}
