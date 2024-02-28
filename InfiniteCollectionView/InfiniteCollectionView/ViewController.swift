//
//  ViewController.swift
//  InfiniteCollectionView
//
//  Created by Saurav Kumar on 28/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infiniteScrollingCollectionView: UICollectionView!
    
    var dataScourceArray: [String] = ["IMBack", "ILLBeBack", "Terminator", "IMBack", "ILLBeBack"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.infiniteScrollingCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infiniteScrollingCollectionView.dataSource = self
        infiniteScrollingCollectionView.delegate = self
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: infiniteScrollingCollectionView.frame.size.height)
        flowlayout.minimumInteritemSpacing = 0
        flowlayout.minimumLineSpacing = 0
        flowlayout.scrollDirection = .horizontal
        infiniteScrollingCollectionView.collectionViewLayout = flowlayout
        let nibName = UINib(nibName: "InfiniteScrollCollectionViewCell", bundle: nil)
        infiniteScrollingCollectionView.register(nibName, forCellWithReuseIdentifier: "InfiniteScrollCollectionViewCell")
    }
    
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataScourceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InfiniteScrollCollectionViewCell", for: indexPath) as? InfiniteScrollCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.contentView.layoutIfNeeded()
        cell.configureCell(imageName: dataScourceArray[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let visibleImage = (scrollView.contentOffset.x / scrollView.frame.size.width)
        let index = Int(round(visibleImage))
        switch index {
        case 0:
            infiniteScrollingCollectionView.scrollToItem(at: [0, 3], at: .left, animated: false)
        case dataScourceArray.count - 1:
            infiniteScrollingCollectionView.scrollToItem(at: [0, 1], at: .left, animated: false)
        default:
            break
        }
    }
    
    
    
}
