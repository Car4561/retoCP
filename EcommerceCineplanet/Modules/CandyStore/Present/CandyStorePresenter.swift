//
//  CandyStorePresent.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation

protocol CandyStoreViewProtocol : class {
    func showViewAssistant()
    func showLoadingPopUp()
    func hideLoadingPopUp()
    func showToastError(error: String)
    func setUpCollectionView()
    func setCandyStoresInCollectionView(candyStores : [CandyStore])
}

protocol CandyStorePresenterProtocol : BasePresenter {
    func loadCandyStores()
}

class CandyStorePresenter  : CandyStorePresenterProtocol {
   
    let view: CandyStoreViewProtocol?
    
    init(view: CandyStoreViewProtocol) {
        self.view = view
    }
    
    func loadCandyStores() {
       
        view?.showLoadingPopUp()
        view?.setUpCollectionView()
        view?.showLoadingPopUp()
        getRestClient().getCandyStoresList(successHandler: { (response) in
            if(response.items != nil){
                self.view?.setCandyStoresInCollectionView(candyStores: response.items)
                self.view?.hideLoadingPopUp()
            }
        }, failHandler: { error in
            self.view?.showToastError(error: error.localizedDescription)
        })
        if !getSession().isViewedAssistant() {
            view?.showViewAssistant()
        }
        getSession().set(true, "viewedAssistant")
    }
    
    
}
