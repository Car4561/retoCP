//
//  PostCulqiApiRequest.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

class PostCulqiApiRequest : BaseApiRequest {
    public var requestBodyObject: BaseObject?
    public var requestMethod: RequestHttpMethod? = RequestHttpMethod.Post
    public var enviroment : Environment = Environment.Culqi

    public var requestPath: String = "/tokens"

    func setBodyObject(bodyObject: CulqiTokenRequest) {
        self.requestBodyObject = bodyObject
    }
}
