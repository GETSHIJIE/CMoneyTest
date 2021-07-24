//
//  Nasa.swift
//  CMoney
//
//  Created by 黃仕杰 on 2021/7/24.
//

import Foundation

struct NasaModel {
    var data: [Nasa]
}

struct Nasa: Codable {
    var description: String?
    var copyright: String?
    var title: String?
    var url: String?
    var apod_site: String?
    var date: String?
    var media_type: String?
    var hdurl: String?
}
