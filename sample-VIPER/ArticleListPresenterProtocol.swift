//
//  ArticleListPresenterProtocol.swift
//  sample-VIPER
//
//  Created by Yudai Fujioka on 2021/07/23.
//

import Foundation

protocol ArticleListPresenterProtocol: AnyObject {
    func didLoad()
    func didSelect(artileEntity: ArticleEntity)
}

protocol ArticleListViewProtocol: AnyObject {
    
    func ahowArticles(_ articleEntities: [ArticleEntity])
    func showEmpty()
    func showError()
}

class ArticleLsitPresenter {
    
    weak var view: ArticleListViewProtocol!
    
    init(view: ArticleListViewProtocol) {
        self.view = view
    }
}

extension ArticleLsitPresenter: ArticleListPresenterProtocol {
    
    func didLoad() {
        GetArticleArrayUseCase().execute(()) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let articleEntities):
                if articleEntities.isEmpty {
                    self.view.showEmpty(articleEntities)
                }
            case .failure(let error):
                self.view.showError(error)
            }
        }
    }
    
    func didSelect(artileEntity: ArticleEntity) {
        <#code#>
    }
}
