//
//  Petrol.swift
//  Try API Call
//
//  Created by admin on 8/29/23.
//

import Foundation

// MARK: - Welcome
struct Petrol: Codable, Identifiable {
    let id: String?
    let title, desc: String?
    let created, updated: Int?
    let createdDate, updatedDate: String?
    let active, visualizable, catalogUUID, source: String?
    let orgType: String?
    let org, sector: [String]?
    let field: [Field]?
    let targetBucket: TargetBucket?
    let message, version, status: String?
    let total, count: Int?
    let limit, offset: String?
    let records: [Record]?
    
    enum CodingKeys: String, CodingKey {
        case id = "index_name"
        case title, desc, created, updated
        case createdDate = "created_date"
        case updatedDate = "updated_date"
        case active, visualizable
        case catalogUUID = "catalog_uuid"
        case source
        case orgType = "org_type"
        case org, sector, field
        case targetBucket = "target_bucket"
        case message, version, status, total, count, limit, offset, records
    }
}

// MARK: - Field
struct Field: Codable {
    let name, id, type, format: String?
}

// MARK: - Record
struct Record: Codable {
    let month: Month?
    let year, oilCompanies, quantity000_MetricTonnes, lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case month, year
        case oilCompanies = "oil_companies_"
        case quantity000_MetricTonnes = "quantity_000_metric_tonnes_"
        case lastUpdated = "last_updated"
    }
}

enum Month: String, Codable {
    case july = "July"
    case june = "June"
}

// MARK: - TargetBucket
struct TargetBucket: Codable {
    let index, type, field: String?
}
