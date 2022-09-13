//
//  News.swift
//  NewsApp-uikit
//
//  Created by Ayberk M on 12.09.2022.
//

import Foundation

struct News {
    let title: String
    let image: String
    let description: String
    let link: String
   
    
    init(title: String, image: String, description: String, link: String ) {
        self.title = title
        self.image = image
        self.description = description
        self.link = link
    }
    
//    func completeToggled() -> News {
//      return News(title: title, image: image, description: description, link: link)
//    } // will be used for isReaded 
    
}
