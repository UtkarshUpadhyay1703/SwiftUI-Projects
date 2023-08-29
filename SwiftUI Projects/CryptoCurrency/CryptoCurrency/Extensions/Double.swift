//
//  Double.swift
//  CryptoCurrency
//
//  Created by admin on 8/29/23.
//

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toPercentString() -> String {
//        guard let numberAsString = numberFormatter.string(for: self) else { return "" }
//        return numberAsString + "%"
        
        //        not working in this format: numberFormatter.string(for: self) ?? "$0.00" + "%"
//        because of precedence issue with the operators. The + operator has higher precedence than the nil coalescing operator, so the expression "$0.00" + "%" is evaluated first, resulting in "0.00%".
        
                return (numberFormatter.string(for: self) ?? "$0.00") + "%"
    }
}
