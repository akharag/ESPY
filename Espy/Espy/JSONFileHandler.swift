//
//  JsonHandler.swift
//  Espy
//
//  Created by Alexander L Kharag on 3/6/19.
//  Copyright © 2019 Desislava Nacheva. All rights reserved.
//
import Foundation
import UIKit
//https://www.youtube.com/watch?v=YY3bTxgxWss
struct Clothing : Decodable{
   
    enum DecodingError : Error {
        case missingFile
    }
    
    let tag : String
    let image : Data
    
    init(filename: String) throws {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw DecodingError.missingFile
        }
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: url)
        self = try decoder.decode(Clothing.self, from: data)
    }
}

extension Array where Element == Clothing {
    init(filename: String) throws {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw Clothing.DecodingError.missingFile
        }
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: url)
        self = try decoder.decode([Clothing].self, from: data)
    }
}
