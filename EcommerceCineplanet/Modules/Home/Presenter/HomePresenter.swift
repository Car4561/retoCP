//
//  HomePresenter.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 16.07.21.
//
protocol HomeViewProtocol: class {
    func showLoadingPopUp()
    func hideLoadingPopUp()
    func showToastError(error: String)
    func setupPremieresSlideScrollView(premieres : [Premier])
}

protocol HomePresenterProtocol : BasePresenter {
    func loadPremieres()
    func onTapImage()
}

import Foundation

class HomePresenter: HomePresenterProtocol {
   
    fileprivate weak var view: HomeViewProtocol?

    init(view: HomeViewProtocol) {
        self.view = view
       
    }
    
    func loadPremieres() {
        view?.showLoadingPopUp()
        getRestClient().getPremieresList(successHandler: {(response) in
            if(response.premieres != nil){
                self.view?.setupPremieresSlideScrollView(premieres: response.premieres)
                self.view?.hideLoadingPopUp()
                
            }
        }, failHandler: {error in
            self.view?.hideLoadingPopUp()
            self.view?.showToastError(error: error.localizedDescription)
        })
        
    }

  
    func onTapImage(){
        
    }
    
    
}
