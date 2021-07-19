//
//  BaseApiRequest.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation
import Alamofire

public protocol BaseApiRequest {
    var requestMethod: RequestHttpMethod?{ get }
    var enviroment: Environment { get }
    var requestBodyObject: BaseObject? { get }
    var requestPath: String {get}
    func request() -> URLRequest
}


extension BaseApiRequest{
    public func request() -> URLRequest {
        let url: URL! = URL(string: baseUrl+requestPath)
        var request = URLRequest(url: url)
        switch requestMethod {
        case .Get:
            request.httpMethod = "GET"
            break
        case .Post:
            request.httpMethod = "POST"
            if(requestBodyObject != nil){
                let jsonEncoder = JSONEncoder()
                do {
                    request.httpBody = try jsonEncoder.encode(requestBodyObject)
                } catch  {
                    print(error)
                }
            }
            break
        default:
            request.httpMethod = "GET"
            break
        }
        if enviroment == .Culqi {
            request.headers = Global.getHeadersForCulqui()
        }
        print("testapi",enviroment)
        return request
    }
    
    
    var baseUrl: String {
        switch enviroment {
            case .Cineplanet:
                return "http://ec2-18-219-76-53.us-east-2.compute.amazonaws.com:8080/cp/v1"
            case .Culqi:
                return "https://secure.culqi.com/v2"
            }
    }
}

public enum RequestHttpMethod{
    case Get
    case Post
}

public enum Environment{
    case Cineplanet
    case Culqi
}




