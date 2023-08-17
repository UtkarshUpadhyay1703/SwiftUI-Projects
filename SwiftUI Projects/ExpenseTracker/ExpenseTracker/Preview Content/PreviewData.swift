//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by admin on 8/14/23.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/14/2022", institution: "Aloha", account: "Visa Aloha", merchant: "Apple", amount: 1105.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)

var transactionListPreviewData = [Transaction] (repeating: transactionPreviewData, count: 10)
