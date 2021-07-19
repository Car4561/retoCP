//
//  HomeViewController.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 16.07.21.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate,HomeViewProtocol  {
    
    var configuration = HomeConfiguration()
    var presenter : HomePresenterProtocol!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 1;
    var totalPages: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration.configure(view: self)
        scrollView.delegate = self
        presenter.loadPremieres()
    }
    
    func setupPremieresSlideScrollView(premieres: [Premier]) {
        pageControl.numberOfPages = premieres.count
        pageControl.currentPage = 0
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: scrollView.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(premieres.count), height: scrollView.frame.height)
        scrollView.isPagingEnabled = true
        totalPages = premieres.count
        var multiplicator = 0
        premieres.map({ (premier) -> PremierSlide in
            let slide:PremierSlide = Bundle.main.loadNibNamed("PremierSlide", owner: self, options: nil)?.first as! PremierSlide
            slide.image.imageFromUrl(urlString: premier.image)
            slide.title.text = premier.description
            slide.frame = CGRect(x: scrollView.frame.width * CGFloat(multiplicator), y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            let premierTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.togglePremier(gestureRecognizer:)))
            premierTap.numberOfTapsRequired = 1
            slide.tag = multiplicator
            slide.addGestureRecognizer(premierTap)
            slide.isUserInteractionEnabled = true
            multiplicator+=1
            scrollView.addSubview(slide)
            return slide
        })
        
        Timer.scheduledTimer(timeInterval: 2.0,
          target: self,
          selector: #selector(self.animateFunction(timer:)),
          userInfo: nil,
          repeats: true)
        
    }

    func showLoadingPopUp() {
        self.waiting(message: "Cargando Premiers...")
    }
    
    func hideLoadingPopUp()  {
        self.closeWaiting()
    }
    
    
    @objc func animateFunction(timer: Timer)
    {
        
        let pageWidth = scrollView.frame.width
        scrollView .setContentOffset(CGPoint(x: pageWidth * CGFloat(currentPage), y: 0.0), animated: true)
        if currentPage ==  totalPages-1 {
            currentPage = -1
        }
        currentPage+=1
      
    }
    
    @objc
    func togglePremier(gestureRecognizer:UIGestureRecognizer) {
        tabBarController?.selectedIndex = 1
        (tabBarController?.navigationItem.titleView as! UILabel).text = "Login"
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/scrollView.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    func showToastError(error: String) {
        self.toast(message: error)
    }
 
}
