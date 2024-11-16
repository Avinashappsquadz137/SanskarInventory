//
//  submittedmdeldata.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 31/07/24.
//


import Foundation

struct InventoryResponse: Codable {
    let status: Bool
    let message: String
    let data: [InventoryDetail]
    let error: String?
}

// Inventory detail model
struct InventoryDetail: Codable {
    let tempID: String
    let compID: String
    let name: String
    let clientName: String
    let empCode: String
    let item: String
    let contactPerson: String
    let personMobileNo: String
    let toLocation: String
    let transportBy: String
    let showDate: String
    let startTime: String
    let endTime: String
    let loadingDate: String
    let loadingTime: String
    let offDate: String
    let remarks: String
    let challanDetail: String
    let products: [Product]
    let qrCodeList: [String]
    
    enum CodingKeys: String, CodingKey {
        case tempID = "TEMP_ID"
        case compID = "COMP_ID"
        case name = "NAME"
        case clientName = "CLIENT_NAME"
        case empCode = "EMPCODE"
        case item = "ITEM"
        case contactPerson = "CONTACT_PERSON"
        case personMobileNo = "PERSON_MOBILE_NO"
        case toLocation = "TO_LOCATION"
        case transportBy = "TRANSPORT_BY"
        case showDate = "SHOW_DATE"
        case startTime = "START_TIME"
        case endTime = "END_TIME"
        case loadingDate = "LOADING_DATE"
        case loadingTime = "LOADING_TIME"
        case offDate = "OFF_DATE"
        case remarks = "REMARKS"
        case challanDetail = "CHALLAN_DETAIL"
        case products
        case qrCodeList = "qr_code_list"
    }
}

// Product model
struct Product: Codable {
    let itemMasterID: String
    let itemName: String
    let itemQRStr: String
    let itemQRThumbnail: String
    let modelNo: String
    let brand: String
    let itemCategory: String
    let categoryName: String
    
    enum CodingKeys: String, CodingKey {
        case itemMasterID = "ITEM_MASTER_ID"
        case itemName = "ITEM_NAME"
        case itemQRStr = "ITEM_QR_STR"
        case itemQRThumbnail = "ITEM_QR_THUMBNAIL"
        case modelNo = "MODEL_NO"
        case brand = "BRAND"
        case itemCategory = "ITEM_CATEGORY"
        case categoryName
    }
}
