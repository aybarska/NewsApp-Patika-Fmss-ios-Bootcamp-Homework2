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
    let isReaded: Bool
   
    
    init(title: String, image: String, description: String, link: String, isReaded: Bool = false ) {
        self.title = title
        self.image = image
        self.description = description
        self.link = link
        self.isReaded = isReaded
    }
    
    func markAsReaded() -> News {
        //make readed
      return News(title: title, image: image, description: description, link: link, isReaded: true)
    }
    
}
