//
//  Router.swift
//  sample-VIPER
//
//  Created by Yudai Fujioka on 2021/07/23.
//

import UIKit

protocol ArticleListRouterProtocol: AnyObject {
    func showArticleDetail(articleEntity: ArticleEntity)
}

class ArticleListRouter: ArticleListRouterProtocol {
   
    
    
    weak var view: UIViewController!
    
    init(view: UIViewController) {
        self.view = view
    }
    
    
    func showArticleDetail(articleEntity: ArticleEntity) {
        print("詳細画面へ遷移する　記事ID:\(articleEntity.id)")
    }
    
}
