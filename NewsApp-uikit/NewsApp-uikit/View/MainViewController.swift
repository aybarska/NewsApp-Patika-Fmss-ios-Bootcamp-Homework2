//
//  MainViewController.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 12.09.2022. 🧚🏻‍♀️
//
import UIKit


class MainViewController: UIViewController {
    
   
    var news = [
        News(title: "Queen Elizabeth’s coffin is en route from Scotland to London", image: "queen", description: "Queen Elizabeth II’s coffin has left Edinburgh on its way to London, accompanied by the deceased monarch’s only daughter, Princess Anne.It is being flown to west London’s RAF Northolt airbase in a C-17 Globemaster transport plane, before it is driven to Buckingham Palace to rest in the Bow Room overnight.", link: "https://edition.cnn.com/2022/09/13/uk/queen-elizabeth-king-charles-northern-ireland-intl-gbr/index.html"),
        
        News(title: "What may have given modern humans an edge over Neanderthals", image: "skull", description: "From studying fossilized skulls, scientists know that the size of a Neanderthal’s brain was the same as, if not slightly bigger than, that of a modern human. However, researchers have known little about Neanderthal.", link: "https://edition.cnn.com/2022/09/13/world/neanderthal-vs-human-brain-scn/index.html"),
        
        News(title: "Twitter shareholders vote in favor of Elon Musk", image: "elon", description: "Elon Musk may be fighting tooth-and-nail to get out of his deal to buy Twitter, but the social media company’s shareholders plan to hold him to it. Twitter (TWTR) shareholders on Tuesday voted in favor of Musk’s $44 billion takeover deal, a value of $54.20 per share.", link:"https://edition.cnn.com/2022/09/13/tech/twitter-elon-musk-deal-shareholder-vote/index.html"),
        
        
        News(title: "Apple releases iOS 16", image: "ios16", description:"Just as it promised it would, today Apple has released new and important updates for a lot of its devices. Let's start with iOS 16. The update to the newest version of iOS, first announced back in June, is now out for the iPhone 8 and newer models, and it will be preinstalled on the new iPhone 14 models when they start shipping this Friday.", link:"https://www.gsmarena.com/apple_releases_ios_16_ios_157_ipados_157_watchos_9_and_tvos_16-news-55758.php"),
        
        News(title: "American inflation rose more than expected in August", image: "dollar", description: "US inflation ticked back up in August, despite plunging gas prices, according to data from the Bureau of Labor Statistics released Tuesday. On a monthly basis, consumer prices rose 0.1% from July, according to the Consumer Price Index, which measures a basket of consumer goods and services.", link: "https://edition.cnn.com/2022/09/13/economy/august-cpi-inflation/index.html"),
        
        News(title: "Karlie Kloss: 'Coding is my new passion'", image: "stylee", description: "My modeling career kicked off when I was only 15, but I have strived to be a student of the world, even as my path became nontraditional. Nearly seven years into my career, I decided to take a coding class -- learning Ruby, HTML and CSS. I was intrigued by the language that powers our everyday lives, so ubiquitous and yet so unknown. That coding class changed the trajectory of my career and sparked a lifelong passion for how technology can be used creatively. ", link: "https://edition.cnn.com/style/article/karlie-kloss-september-issues/index.html"),
        
        News(title: "Burger King has a plan", image: "burger", description: "The past few years have been tough for Burger King. Missteps during the pandemic caused the chain to lag behind competitors. Over the past few quarters, Burger King has been playing catch up, and now the company is hoping a major investment in restaurants and advertising will help spark growth and propel it ahead of its peers.", link: "https://edition.cnn.com/2022/09/12/business/burger-king-whopper/index.html"),
        
        
        News(title: "Lakers 'Ongoing Talks' With Jazz", image: "lakers", description: "The Utah Jazz and Los Angeles Lakers are reportedly holding ongoing talks, according to The Athletic's Tony Jones, though he added that the Jazz don't appear to be particularly close to a trade that could land them even more assets and consolidate the roster.", link: "https://bleacherreport.com/articles/10049039-lakers-trade-rumors-los-angeles-engaged-in-ongoing-talks-with-jazz")
        
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
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
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        let new = self.news[indexPath.row].markAsReaded()
        self.news[indexPath.row] = new
        //collectionView.reloadItems(at: [indexPath]) // not workin properly
        detailsVC?.selectedNewsData = new
        detailsVC?.title = new.title
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
        cell.configure(image: UIImage(named: new.image)!, title: new.title,isReaded: new.isReaded)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftAndRightPaddings: CGFloat = 15.0 // things gets messy below that number
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width + 50)

    }

}


    

