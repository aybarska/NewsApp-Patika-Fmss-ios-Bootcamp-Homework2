//
//  MainViewController.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 12.09.2022.
//
import UIKit

class MainViewController: UIViewController {

    var news = [
    News(title: "xercitation ullamco laboris nisi ut aliquip ex ea commodo consequat?", image: "where", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore "),
    News(title: "Ut enim ad minim veniam, quis nostrud exercitation", image: "soccer", description: "Ut enim ad minim veniam, quis nostrud. "),
    News(title: "Excepteur sint occaecat cupidatat", image: "btc", description: " Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
    ]
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("test")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize  = CGSize(width: 100, height: 250)
        collectionView.collectionViewLayout = layout
        collectionView.register(NewsCollectionViewCell.nib(), forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }


}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let new = news[indexPath.row]

        print("item secildi \(new.title)")
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as! NewsCollectionViewCell
        let new = news[indexPath.row]
        
        
        cell.configure(image: UIImage(named: new.image)!, title: new.title)
//        let cellBg = UIView()
//        cellBg.backgroundColor = UIColor(patternImage:UIImage(named:"border")!)
//        cell.backgroundView = cellBg
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let leftAndRightPaddings: CGFloat = 15.0
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width + 50)

    }

}
    

