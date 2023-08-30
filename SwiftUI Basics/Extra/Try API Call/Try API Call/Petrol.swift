//
//  Petrol.swift
//  Try API Call
//
//  Created by admin on 8/29/23.
//

import Foundation

// MARK: - Welcome
struct Petrol: Codable {
    let indexName, title, desc, orgType: String?
    let org: [String]?
    let type, source, active, visualizable: String?
    let created, updated: Int?
    let createdDate, updatedDate: Date?
    let catalogUUID, resourceUUID: String?
    let targetBucket: TargetBucket?
    let field: [Field]?
    let message, version, status: String?
    let total, count: Int?
    let limit, offset: String?
    let records: [Record]?

    enum CodingKeys: String, CodingKey {
        case indexName = "index_name"
        case title, desc
        case orgType = "org_type"
        case org, type, source, active, visualizable, created, updated
        case createdDate = "created_date"
        case updatedDate = "updated_date"
        case catalogUUID = "catalog_uuid"
        case resourceUUID = "resource_uuid"
        case targetBucket = "target_bucket"
        case field, message, version, status, total, count, limit, offset, records
    }
}

struct Record: Codable {
    let month, year, products, trade: String
    let quantity000MetricTonnes, valueInRupeesCrore, valueInDollarsMillionUSDollar, dateUpdated: String

    enum CodingKeys: String, CodingKey {
        case month = "Month"
        case year = "Year"
        case products = "PRODUCTS"
        case trade = "TRADE"
        case quantity000MetricTonnes = "Quantity (000 Metric Tonnes)"
        case valueInRupeesCrore = "Value in Rupees (Crore)"
        case valueInDollarsMillionUSDollar = "Value in Dollars (Million US dollar)"
        case dateUpdated = "date_updated"
    }
}

// MARK: - TargetBucket
struct TargetBucket: Codable {
    let index, type: String
}

// MARK: - Field
struct Field: Codable {
    let id, name, type: String
    let format: String?
}
