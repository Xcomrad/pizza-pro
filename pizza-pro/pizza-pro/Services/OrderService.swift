
import Foundation

final class Order {
    
        var products: [Product]
    
        init(products: [Product]) {
            self.products = products
        }
        
        var totalPrice: Int {
            return products.reduce(0) { acc, curr in
                acc + (curr.count ?? 1) * (curr.price)
            }
        }
        
        var totalCount: Int {
            return Int(products.reduce(0) { acc, curr in
                acc + (curr.count ?? 1)
            })
        }
        
        var totalCoin: Int {
            let result = 0
            for product in products {
                return (product.coin ?? 0) * totalCount
            }
            return result
        }
    }
