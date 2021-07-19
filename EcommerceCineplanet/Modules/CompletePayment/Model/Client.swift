//
//  Client.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

class Client: Codable {
    let deviceFingerprint: JSONNull?
    let ipCountryCode, ip, browser, ipCountry: String
    let deviceType: String

    enum CodingKeys: String, CodingKey {
        case deviceFingerprint = "device_fingerprint"
        case ipCountryCode = "ip_country_code"
        case ip, browser
        case ipCountry = "ip_country"
        case deviceType = "device_type"
    }

    init(deviceFingerprint: JSONNull?, ipCountryCode: String, ip: String, browser: String, ipCountry: String, deviceType: String) {
        self.deviceFingerprint = deviceFingerprint
        self.ipCountryCode = ipCountryCode
        self.ip = ip
        self.browser = browser
        self.ipCountry = ipCountry
        self.deviceType = deviceType
    }
}
