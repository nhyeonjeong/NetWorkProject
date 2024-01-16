//
//  BeerRandomViewController.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/17.
//

import UIKit
import Kingfisher

// 두 번 째 탭
class BeerRandomViewController: UIViewController {

    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    @IBOutlet weak var randomButton: UIButton!
    
    let apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView()
        
        requestSettingData()
        
    }
    
    @IBAction func randomButtonClicked(_ sender: UIButton) {
        requestSettingData()
    }
    
    func requestSettingData() {
        apiManager.beearRequest() { beer in
            self.configureView(data: beer)
        }
    }
    
    func configureView(data: Beer) {

        beerImageView.image = UIImage(systemName: "nosign")
        // image_url이 nil이 아니고 유효하다면 이미지 세팅
        // 그렇지 않다면 "nosign"시스템 이미지를 세팅
        if let url = URL(string: data.image_url ?? "") {
            beerImageView.kf.setImage(with: url)
            
        }
        
        beerNameLabel.text = data.name
        beerDescriptionLabel.text = data.description
        
    }
    
}

// UI
extension BeerRandomViewController {
    func settingView() {
        beerImageView.contentMode = .scaleAspectFit
        beerImageView.tintColor = .red
        
        beerNameLabel.font = .boldSystemFont(ofSize: 17)
        beerNameLabel.textAlignment = .center
        
        beerDescriptionLabel.font = .boldSystemFont(ofSize: 13)
        beerDescriptionLabel.textAlignment = .center
        beerDescriptionLabel.numberOfLines = 0
        
        randomButton.setImage(UIImage(systemName: "t.bubble.he"), for: .normal)
        randomButton.tintColor = .orange
        randomButton.setTitleColor(.orange, for: .normal)
        randomButton.setTitle("다른 맥주 추천받기", for: .normal)
        
    }
}
