//
//  DrinkModel.swift
//  Revision
//
//  Created by Santiago Castañeda Restrepo- Ceiba Software on 28/12/21.
//

import UIKit

struct Response: Codable {
    let drinks:[Drink]
}

struct Drink: Codable {
    let idDrink: String
    let strDrink: String
    let strDrinkThumb: String
}
