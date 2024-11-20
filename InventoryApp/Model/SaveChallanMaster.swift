//
//  SaveChallanMaster.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 20/11/24.
//

import Foundation

// MARK: - SaveChallanMaster
struct SaveChallanMaster : Codable {
    let status : Bool?
    let message : String?
    let data : Datas?
    let error : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
        case error = "error"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(Datas.self, forKey: .data)
        error = try values.decodeIfPresent(String.self, forKey: .error)
    }

}

struct Datas : Codable {
    let temp_id : String?

    enum CodingKeys: String, CodingKey {

        case temp_id = "temp_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        temp_id = try values.decodeIfPresent(String.self, forKey: .temp_id)
    }

}
