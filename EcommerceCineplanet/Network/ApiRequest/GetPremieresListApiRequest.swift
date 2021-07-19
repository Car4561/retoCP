//
//  GetPremieresListApiRequest.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation

public class GetEventListApiRequest: BaseApiRequest {
    public var requestBodyObject: BaseObject?
    public var requestMethod: RequestHttpMethod?
    public var requestPath: String = "/premieres" 
    public var enviroment : Environment = Environment.Cineplanet
    
}
