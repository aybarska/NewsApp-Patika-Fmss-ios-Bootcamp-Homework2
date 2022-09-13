//
//  MainViewController.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 12.09.2022.
//
import UIKit

//protocol NewsSelectionDelegate {
//    func didTapChoice(title: String, description: String, image: String)
//}

class MainViewController: UIViewController {
  //  var selectionDelegate: NewsSelectionDelegate!

    var news = [
        News(title: "where?", image: "where", description: "where desc", link: "google1.com"),
        News(title: "item2 soccer", image: "soccer", description: "soccer play goal faul ", link: "google2.com"),
        News(title: "item3 btc item3 btc item3 btc item3 btc item3 btc", image: "btc", description:" btc money bank ", link: "google3.com")
    ]
  
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
       // selectionDelegate.didTapChoice(title: new.title, description: new.description, image: new.image)
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        detailsVC?.newTitle = new.title
        detailsVC?.newDesc = new.description
        detailsVC?.newImage = new.image
        detailsVC?.newLink = new.link

        self.navigationController?.pushViewController(detailsVC!, animated: true)
        
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
    

