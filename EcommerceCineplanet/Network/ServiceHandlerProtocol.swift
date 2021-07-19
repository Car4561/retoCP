//
//  ServiceHandlerProtocol.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation

public protocol ServiceHandlerProtocol {

    func getPremieresList(successHandler:@escaping(PremierResponse)->(),
                      failHandler:@escaping(Error)->())
    
    func getCandyStoresList(successHandler:@escaping(CandyStoreResponse)->(),
                      failHandler:@escaping(Error)->())
    

}
