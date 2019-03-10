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
struct Clothing : Codable{
   
    enum DecodingError : Error {
        case missingFile
    }
    
    let tag : String
    let image : String
    
    init(filename: String) throws{
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw DecodingError.missingFile
        }
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: url)
        self = try decoder.decode(Clothing.self, from: data)
    }
    
    init(inputTag: String, inputImage: String){
        tag = inputTag
        image = inputImage
    }
    
    mutating func loadFromJSONFile(filename: String) throws{
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
        print(url)
        let decoder = JSONDecoder()
        let data = try Data(contentsOf: url)
        self = try decoder.decode([Clothing].self, from: data)
    }
//    mutating func loadFromJSONFile(filename: String) throws{
//        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
//        throw Clothing.DecodingError.missingFile
//        }
//        let decoder = JSONDecoder()
//        let data = try Data(contentsOf: url)
//        self = try decoder.decode([Clothing].self, from: data)
//    }
}

func loadFromJSONFile(filename: String) throws -> [Clothing]!{
    var fileURL:URL!
    let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    fileURL = baseURL.appendingPathComponent("wardrobe.json")
    
    let data = try Data(contentsOf: fileURL)
    
    let clothingArr = decodeJSON(data: data)
    
    return clothingArr
}

func saveToJSON(clothingArr: [Clothing], filename: String) {
    let wardrobe = encodeJSON(arr: clothingArr)
    var fileURL:URL!
    
    let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    fileURL = baseURL.appendingPathComponent("wardrobe.json")
    
    let dataString = wardrobe!.base64EncodedString(options: .endLineWithLineFeed)
    do{
        try dataString.write(to: fileURL, atomically: true, encoding: .utf8)
    }catch let error as NSError{
        print("Error saving to file: \(error)")
    }
}

func encodeJSON(arr: [Clothing]!) -> Data!{
    var data:Data? = nil
    let encoder = JSONEncoder()
    data = try? encoder.encode(arr)
    
    return data
}

func decodeJSON(data: Data!) -> [Clothing]!{
    var arr:[Clothing]! = nil
    let decoder = JSONDecoder()
    
    do{
        try arr = decoder.decode([Clothing].self, from: data)
    }catch let error as NSError{
        print("Error Reading Json File \(error.localizedDescription)")
    }
    
    return arr
}

//func saveToJSONFile(arr: [Clothing], filename: String){
//    var fileText : String = ""
//
//    print("\(filename)")
//    let fileURL = Bundle.main.url(forResource: filename, withExtension: "json")!
//    print("\(filename.debugDescription)")
//
//
//    fileText += "[\n"
//    for i in 0...arr.count-1{
//        fileText += "\t{\n\t\"tag\" : \"" + arr[i].tag + "\"\n"
//        fileText += "\t\"image\" : \"" + arr[i].image + "\"\n\t}\n"
//        if i < arr.count-1{
//            fileText += ",\n"
//        }
//    }
//    fileText += "]"
//
//    let filedata:Data = fileText.data(using: .utf8)!
//
//    print(fileText)
//    //    do{
//    //        try fileText.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
//    //    }catch let error as NSError{
//    //        print("Failed to write to URL: \(String(describing: fileURL)) ")
//    //        print(error)
//    //    }
//}

var wardrobeItems = [Clothing]()
