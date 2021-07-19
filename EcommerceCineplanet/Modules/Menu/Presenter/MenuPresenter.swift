//
//  MenuPresenter.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 16.07.21.
//

import Foundation

protocol MenuViewProtocol: class {
    func prepareNavigationItem()
}

protocol MenuPresenterProtocol {
    func viewDidLoad()
}


class MenuPresenter: MenuPresenterProtocol {
    
    let view : MenuViewProtocol?
    
    init(view: MenuViewProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.prepareNavigationItem()
    }
    

}
