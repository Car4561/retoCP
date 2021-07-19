//
//  BasePresent.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation
public protocol BasePresenter{
    
    func getRestClient() -> RestClient
    func getSession() -> Session

}
extension BasePresenter{
    
    func getRestClient() -> RestClient{
        return RestClient.sharedInstance
    }
    
    func getSession() -> Session{
        return Session()
    }

}
