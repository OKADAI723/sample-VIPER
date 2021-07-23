//
//  UseCaseProtocol.swift
//  sample-VIPER
//
//  Created by Yudai Fujioka on 2021/07/23.
//

import Foundation

//Interactorの作成
protocol UserCaseProtocol where Failure: Error {
    associatedtype Parameter
    associatedtype Success
    associatedtype Failure
    
    func execute(_ parameter: Parameter, completion: ((Result<Success, Failure>) -> ())?)
}

class UseCase<Parameter, Success, Failure: Error> {
    
    private let instance: UseCaseInstanceBase<Parameter, Success, Failure>
    
    init<T: UserCaseProtocol> (_ useCase: T) where T.Parameter == Parameter,
                                                   T.Success == Success,
                                                   T.Failure == Failure  {
        self.instance = UseCaseInstance<T>(useCase)
    }
    
    func execute(_ parameter: Parameter, completion: ((Result<Success, Failure>) -> ())?) {
        instance.execute(parameter, completion: completion)
    }
}

private extension UseCase {
    class UseCaseInstanceBase<Parameter, Success, Failure: Error> {
        func execute(_ parameter: Parameter, completion: ((Result<Success, Failure>) -> ())?) {
            fatalError()
        }
    }
    
    class UseCaseInstance<T: UserCaseProtocol>: UseCaseInstanceBase<T.Parameter, T.Success, T.Failure> {
        private let useCase: T
        
      
        init(_ useCase: T) {
            self.useCase = useCase
        }
        
        override func execute(_ parameter: T.Parameter, completion: ((Result<T.Success, T.Failure>) -> ())?) {
            useCase.execute(parameter, completion: completion)
        }
    }
}
