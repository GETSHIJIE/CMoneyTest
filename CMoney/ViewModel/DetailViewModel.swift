//
//  DetailViewModel.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import Foundation

class DetailViewModel: NSObject {
    
    private let model: Nasa
    
    var title: String {
        return model.title ?? ""
    }
    var date: String {
        let s = DateUtil.convertDateString(
            dateString: model.date ?? "0000-01-01",
            fromFormat: "YYYY-MM-dd",
            toFormat: "YYYY MMM. dd")
        return s
    }
    var copyRight: String {
        return model.copyright ?? ""
    }
    var descriptions: String {
        return model.description ?? ""
    }
    var hdLink: String {
        return model.hdurl ?? ""
    }
    
    init(model: Nasa) {
        self.model = model
    }
    
}

