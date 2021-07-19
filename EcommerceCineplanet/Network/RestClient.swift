//
//  RestClient.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation
import Alamofire

public class RestClient: ServiceHandlerProtocol {

    static let sharedInstance:RestClient = RestClient.init()
    
    private init() {}
    
    private func sendRequest<T:Codable>(_ request:BaseApiRequest,_ type :T.Type,successHandler:@escaping(T)->(),failHandler:@escaping(Error)->()){
        AF.request(request.request()).responseDecodable(of: T.self) { (response) in
             switch response.result{
                       case .success(let responseEventList):
                           successHandler(responseEventList)
                           print("success")
                       case .failure(let error):
                           failHandler(error)
                           print("fail")
            }
        }
    }
    
    public func getPremieresList(successHandler: @escaping (PremierResponse) -> (), failHandler: @escaping (Error) -> ()) {
        let request = GetEventListApiRequest();
        sendRequest(request, PremierResponse.self, successHandler: successHandler, failHandler: failHandler)
    }

    
    public func getCandyStoresList(successHandler: @escaping (CandyStoreResponse) -> (), failHandler: @escaping (Error) -> ()) {
        let request = GetCandyStoresListApiRequest();
        print("requesttt",request.baseUrl)
        sendRequest(request, CandyStoreResponse.self, successHandler: successHandler, failHandler: failHandler)
    }
    
    public func postCulqiToken(culqiToken: CulqiTokenRequest,successHandler: @escaping (TokenCard) -> (), failHandler: @escaping (Error) -> ()) {
           let request = PostCulqiApiRequest();
           request.setBodyObject(bodyObject: culqiToken)
           sendRequest(request, TokenCard.self, successHandler: successHandler, failHandler: failHandler)
    }
    
    public func postComplete(complete: Complete, successHandler: @escaping (CompleteResponse) -> (), failHandler: @escaping (Error) -> ()) {
           let request = PostCompleteApiRequest();
           request.setBodyObject(bodyObject: complete)
           sendRequest(request, CompleteResponse.self, successHandler: successHandler, failHandler: failHandler)
    }
    
   }
