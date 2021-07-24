//
//  NasaViewModel.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import Foundation

typealias BindToControllerBlock = (()->Void)

class NasaViewModel: NSObject {
    
    // MARK: Model
    private(set) var result: Result
    
    // MARK: Server API
    private let nasaAPI: NasaAPI
    
    // MARK: Block
    var bindToControllerBlock: BindToControllerBlock = {}
    
    init(nasaAPI: NasaAPI) {
        self.nasaAPI = nasaAPI
        self.result = Result(model: nil, error: .Unknown)
        super.init()
        
        bindToController()
    }
    
    private func bindToController() {
        nasaAPI.apiTo { [self] (nasaModel) in
            self.result = Result(model: nasaModel, error: .ApiSuccess)
            bindToControllerBlock()
        } failed: { [self] in
            self.result = Result(model: nil, error: .ApiUnCatch)
            bindToControllerBlock()
        }
    }
    
    func bindToDetailViewModel(nasa: Nasa) -> DetailViewModel  {
        return DetailViewModel(model: nasa)
    }
}

extension  NasaViewModel {
    
    enum Error {
        case ApiSuccess
        case ApiUnCatch
        case Unknown
    }
    struct Result {
        let model: NasaModel?
        let error: Error
    }
    
}
