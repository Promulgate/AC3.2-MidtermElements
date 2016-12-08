//
//  Element.swift
//  Elements
//
//  Created by Eric Chang on 12/8/16.
//  Copyright © 2016 Eric Chang. All rights reserved.
//

import Foundation

class Element {
    let id: Int
    let weight: Double
    let name: String
    let symbol: String
    let melting: Int
    let boiling: Int
    let density: Double
    let electrons: String

    init(id: Int, weight: Double, name: String, symbol: String, melting: Int, boiling: Int, density: Double, electrons: String) {
        self.id = id
        self.weight = weight
        self.name = name
        self.symbol = symbol
        self.melting = melting
        self.boiling = boiling
        self.density = density
        self.electrons = electrons
    }
    
    static func getElement(data: Data?) -> [Element]? {
        var elements = [Element]()
        
        let data = try? JSONSerialization.jsonObject(with: data!, options: [])
        if let json = data as? [[String: Any]] {
            
            for each in json {
                
                let id = each["id"] as? Int ?? 0
                let weight = each["weight"] as? Double ?? 0
                let name = each["name"] as? String ?? "No Name"
                let symbol = each["symbol"] as? String ?? "No Symbol"
                let melting = each["melting_c"] as? Int ?? 0
                let boiling = each["boiling_c"] as? Int ?? 0
                let density = each["density"] as? Double ?? 0
                let electrons = each["electrons"] as? String ?? "No Electrons"

                let validElement = Element(id: id,
                                           weight: weight,
                                           name: name,
                                           symbol: symbol,
                                           melting: melting,
                                           boiling: boiling,
                                           density: density,
                                           electrons: electrons)
                elements.append(validElement)
            }
            return elements
        }
        print("parse error")
        return nil
    }

}
