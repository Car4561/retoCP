//
//  PostCompleteApiRequest.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 18.07.21.
//

import Foundation

class PostCompleteApiRequest : BaseApiRequest {
    public var requestBodyObject: BaseObject?
    public var requestMethod: RequestHttpMethod? = RequestHttpMethod.Post
    public var enviroment : Environment = Environment.Cineplanet

    public var requestPath: String = "/complete"

    func setBodyObject(bodyObject: Complete) {
        self.requestBodyObject = bodyObject
    }
}
