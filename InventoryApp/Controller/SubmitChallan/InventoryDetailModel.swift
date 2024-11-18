//
//  InventoryDetailModel.swift
//  InventoryApp
//
//  Created by Avinash Gupta on 17/11/24.
//
//import Foundation
//
//// MARK: - InventoryDetail
//struct InventoryDetail: Codable {
//    let status: Bool
//    let message: String
//    let data: [Datum]
//    let error: JSONNull?
//}
//
//// MARK: - Datum
//struct Datum: Codable {
//    let challanDate, loadingDate, chalanqr, officeCallTime: String
//    let itemDetails, personMobileNo, empcode, clientEmailid: String
//    let showDate, offDate: String
//    let miscItem: JSONNull?
//    let createdDate, submitChallanDate, toLocation: String
//    let qrCodeList: [String]
//    let itemQuantityDetail, transportNo, tempID, endTime: String
//    let status, challanDetail, clientName, transportDetail: String
//    let saveChallanDate, transportBy, empICS, remarks: String
//    let returnDate, fromLocation, title, name: String
//    let startTime, contactPerson: String
//    let products: [Product]
//    let updatedDate, loadingTime, item, compID: String
//
//    enum CodingKeys: String, CodingKey {
//        case challanDate = "CHALLAN_DATE"
//        case loadingDate = "LOADING_DATE"
//        case chalanqr = "CHALANQR"
//        case officeCallTime = "OFFICE_CALL_TIME"
//        case itemDetails = "ITEM_DETAILS"
//        case personMobileNo = "PERSON_MOBILE_NO"
//        case empcode = "EMPCODE"
//        case clientEmailid = "CLIENT_EMAILID"
//        case showDate = "SHOW_DATE"
//        case offDate = "OFF_DATE"
//        case miscItem = "MISC_ITEM"
//        case createdDate = "CREATED_DATE"
//        case submitChallanDate = "SUBMIT_CHALLAN_DATE"
//        case toLocation = "TO_LOCATION"
//        case qrCodeList = "qr_code_list"
//        case itemQuantityDetail = "ITEM_QUANTITY_DETAIL"
//        case transportNo = "TRANSPORT_NO"
//        case tempID = "TEMP_ID"
//        case endTime = "END_TIME"
//        case status = "STATUS"
//        case challanDetail = "CHALLAN_DETAIL"
//        case clientName = "CLIENT_NAME"
//        case transportDetail = "TRANSPORT_DETAIL"
//        case saveChallanDate = "SAVE_CHALLAN_DATE"
//        case transportBy = "TRANSPORT_BY"
//        case empICS = "EMP_ICS"
//        case remarks = "REMARKS"
//        case returnDate = "RETURN_DATE"
//        case fromLocation = "FROM_LOCATION"
//        case title = "TITLE"
//        case name = "NAME"
//        case startTime = "START_TIME"
//        case contactPerson = "CONTACT_PERSON"
//        case products
//        case updatedDate = "UPDATED_DATE"
//        case loadingTime = "LOADING_TIME"
//        case item = "ITEM"
//        case compID = "COMP_ID"
//    }
//}
//
//// MARK: - Product
//struct Product: Codable {
//    let itemQrStr, pancard, challanID, itemID: String
//    let itemMasterID, vendorName, createdBy, gstNo: String
//    let srNumber, brand, showDate, itemThumbnail: String
//    let offDate, modelNo, address, itemCategoryID: String
//    let createdDate, lastmodifiedDate, status, categoryName: String
//    let mobile, purchaseDate, itemCategory, itemName: String
//    let createdIP, itemQrThumbnail, itemCSVFile, referenceFile: String
//    let emailID, attachmentFile, itemDesc, amount: String
//    let compID: String
//
//    enum CodingKeys: String, CodingKey {
//        case itemQrStr = "ITEM_QR_STR"
//        case pancard = "PANCARD"
//        case challanID = "CHALLAN_ID"
//        case itemID = "ITEM_ID"
//        case itemMasterID = "ITEM_MASTER_ID"
//        case vendorName = "VENDOR_NAME"
//        case createdBy = "CREATED_BY"
//        case gstNo = "GST_NO"
//        case srNumber = "SR_NUMBER"
//        case brand = "BRAND"
//        case showDate = "SHOW_DATE"
//        case itemThumbnail = "ITEM_THUMBNAIL"
//        case offDate = "OFF_DATE"
//        case modelNo = "MODEL_NO"
//        case address = "ADDRESS"
//        case itemCategoryID = "ITEM_CATEGORY_ID"
//        case createdDate = "CREATED_DATE"
//        case lastmodifiedDate = "LASTMODIFIED_DATE"
//        case status = "STATUS"
//        case categoryName
//        case mobile = "MOBILE"
//        case purchaseDate = "PURCHASE_DATE"
//        case itemCategory = "ITEM_CATEGORY"
//        case itemName = "ITEM_NAME"
//        case createdIP = "CREATED_IP"
//        case itemQrThumbnail = "ITEM_QR_THUMBNAIL"
//        case itemCSVFile = "ITEM_CSV_FILE"
//        case referenceFile = "REFERENCE_FILE"
//        case emailID = "EMAIL_ID"
//        case attachmentFile = "ATTACHMENT_FILE"
//        case itemDesc = "ITEM_DESC"
//        case amount = "AMOUNT"
//        case compID = "COMP_ID"
//    }
//}
