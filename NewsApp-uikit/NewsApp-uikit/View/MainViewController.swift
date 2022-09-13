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
        News(title: "Queen Elizabeth’s coffin is en route from Scotland to London", image: "queen", description: "Queen Elizabeth II’s coffin has left Edinburgh on its way to London, accompanied by the deceased monarch’s only daughter, Princess Anne.It is being flown to west London’s RAF Northolt airbase in a C-17 Globemaster transport plane, before it is driven to Buckingham Palace to rest in the Bow Room overnight. Anne was also the only one of the Queen’s four children to accompany her coffin from Balmoral Castle to Edinburgh on Monday. Earlier Tuesday it was taken to the city’s airport from St. Giles’ Cathedral in a hearse.", link: "https://edition.cnn.com/2022/09/13/uk/queen-elizabeth-king-charles-northern-ireland-intl-gbr/index.html"),
        
        News(title: "What may have given modern humans an edge over Neanderthals", image: "skull", description: "From studying fossilized skulls, scientists know that the size of a Neanderthal’s brain was the same as, if not slightly bigger than, that of a modern human. However, researchers have known little about Neanderthal brain development because soft tissue doesn’t preserve well in the fossil record.", link: "https://edition.cnn.com/2022/09/13/world/neanderthal-vs-human-brain-scn/index.html"),
        
        News(title: "Twitter shareholders vote in favor of Elon Musk", image: "elon", description: "Elon Musk may be fighting tooth-and-nail to get out of his deal to buy Twitter, but the social media company’s shareholders plan to hold him to it. Twitter (TWTR) shareholders on Tuesday voted in favor of Musk’s $44 billion takeover deal, a value of $54.20 per share. The company’s stock opened Tuesday at just under $41 per share, nearly 25% below the deal price.", link:"https://edition.cnn.com/2022/09/13/tech/twitter-elon-musk-deal-shareholder-vote/index.html"),
        
        
        News(title: "Apple releases iOS 16", image: "ios16", description:"Just as it promised it would, today Apple has released new and important updates for a lot of its devices. Let's start with iOS 16. The update to the newest version of iOS, first announced back in June, is now out for the iPhone 8 and newer models, and it will be preinstalled on the new iPhone 14 models when they start shipping this Friday (aside from the iPhone 14 Plus which is getting a later release starting on October 7 - but it too will ship with iOS 16 on board).", link:"https://www.gsmarena.com/apple_releases_ios_16_ios_157_ipados_157_watchos_9_and_tvos_16-news-55758.php"),
        
        News(title: "American inflation rose more than expected in August", image: "dollar", description: "US inflation ticked back up in August, despite plunging gas prices, according to data from the Bureau of Labor Statistics released Tuesday. On a monthly basis, consumer prices rose 0.1% from July, according to the Consumer Price Index, which measures a basket of consumer goods and services. Economists had projected that inflation would fall from July to August by 0.1%, after holding steady at 0% growth from June to July.", link: "https://edition.cnn.com/2022/09/13/economy/august-cpi-inflation/index.html"),
        
        News(title: "Burger King has a plan", image: "burger", description: "The past few years have been tough for Burger King. Missteps during the pandemic caused the chain to lag behind competitors. Over the past few quarters, Burger King has been playing catch up, and now the company is hoping a major investment in restaurants and advertising will help spark growth and propel it ahead of its peers. In the next two years, Burger King, which is owned by Restaurant Brands International (QSR), is planning to invest $400 million in improving the brand — $250 million will go toward updating restaurant tech, kitchens and remodeling, and $150 million to advertising and digital products. Franchisees will also invest in improving the brand.", link: "https://edition.cnn.com/2022/09/12/business/burger-king-whopper/index.html")
        
        
        
        
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
    

