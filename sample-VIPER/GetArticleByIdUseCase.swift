//
//  GetArticleByIdUseCase.swift
//  sample-VIPER
//
//  Created by Yudai Fujioka on 2021/07/23.
//

import Foundation

class GetArticleByIdUseCase: UserCaseProtocol {
    
    func execute(_ parameter: Parameter, completion: ((Result<ArticleEntity, Error>) -> ())?) {
        let response = ArticleEntity(id: 1, userId: 1, title: "タイトル", body: "本文")
        completion?(.success(response))
    }
}
