//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String { get }
    func price() -> Int
}

class Item : SKU {
    let name: String
    private let itemPrice: Int
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.itemPrice = priceEach
    }
    
    func price() -> Int {
        return itemPrice
    }
}

class Receipt {
    private var skuItems: [SKU] = []
    
    public func add(_ item: SKU) -> Void {
        skuItems.append(item)
    }
    
    public func items() -> [SKU] {
        return skuItems
    }
    
    public func output() -> String {
        var output = "Receipt:\n"
        for item in skuItems {
            output += "\(item.name): $\(Double(item.price())/100.0)\n"
        }
        output += "------------------\n"
        output += "TOTAL: $\(Double(total())/100.0)"
        return output
    }
    
    func total() -> Int {
        var total = 0
        for item in skuItems {
            total += item.price()
        }
        return total
    }
}

class Register {
    private var receipt: Receipt
    
    init() {
        receipt = Receipt()
    }
    
    public func scan(_ item: SKU) -> Void {
        receipt.add(item)
    }
    
    public func subtotal() -> Int {
        return receipt.total()
    }
    
    public func total() -> Receipt {
        let transaction = receipt
        receipt = Receipt()
        return transaction
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}
