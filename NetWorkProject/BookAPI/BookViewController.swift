//
//  BookViewController.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/17.
//

import UIKit

class BookViewController: UIViewController {

    @IBOutlet weak var bookSearchBar: UISearchBar!
    @IBOutlet weak var bookCollectionView: UICollectionView!
    
    let apiManager = APIManager()
    
    var bookList: [Document] = []
    var width = UIScreen.main.bounds.width
    let verticalSpacing: CGFloat = 10
    let horizontalSpacing: CGFloat = 10
    
    let inset: CGFloat = 20
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    func configureView() {
        navigationItem.title = "님의 책장"
        bookCollectionView.delegate = self
        bookCollectionView.dataSource = self
        
        bookSearchBar.delegate = self
        
        let xib = UINib(nibName: "BookCollectionViewCell", bundle: nil)
        bookCollectionView.register(xib, forCellWithReuseIdentifier: "BookCollectionViewCell")
      
    }
    
    func getLayout() {
        width = (width - (inset * 2 + horizontalSpacing)) / 2
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = verticalSpacing
        layout.minimumInteritemSpacing = horizontalSpacing
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        // UICollectionViwFlowLayout타입이 어떻게 CollectionViewLayout타입에 할당되는지? ->
        bookCollectionView.collectionViewLayout = layout
        
    }
    func callRequest(text: String) {
        apiManager.kakaoBookRequest(text: text) { book in
            self.bookList = book.documents
            self.bookCollectionView.reloadData()
        }
    }

}


extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bookCollectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        
        cell.configureCell(data: bookList[indexPath.row])
        
        
        return cell
    }
    
    
}


extension BookViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print(#functino)
        callRequest(text: searchBar.text!)
        bookCollectionView.reloadData()
    }
}
