//
//  GetArticleArrayUseCase.swift
//  sample-VIPER
//
//  Created by Yudai Fujioka on 2021/07/23.
//

import Foundation

class GetArticleArrayUseCase: UserCaseProtocol {
    
    func execute(_ parameter: Void, completion: ((Result<[ArticleEntity], Error>) -> ())?) {
        let response: [ArticleEntity] = [
            ArticleEntity(id: 1, userId: 1, title: "タイトル", body: "本文"),
            ArticleEntity(id: 2, userId: 2, title: "タイトル", body: "本文"),
            ArticleEntity(id: 3, userId: 3, title: "タイトル", body: "本文")
        ]
        completion?(.success(response))
    }
}
