//
//  GetCandyStoresListApiRequest.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation

public class GetCandyStoresListApiRequest: BaseApiRequest {
    public var requestBodyObject: BaseObject?
    public var requestMethod: RequestHttpMethod?
    public var requestPath: String = "/candystore" 
    public var enviroment : Environment = Environment.Cineplanet
    
}
