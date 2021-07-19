//
//  CandyStoreViewController.swift
//  EcommerceCineplanet
//
//  Created by carlos alfredo llerena huayta on 17.07.21.
//

import Foundation
import UIKit

class CandyStoreViewController : UIViewController , CandyStoreViewProtocol {
    
    let configuration = CandyStoreConfiguration()
    
    var presenter: CandyStorePresenterProtocol?
    
    var candyStores : [CandyStore]!
    
    var cellCandyStores: [CellCandyStore] = []
    
    var color : UIColor!

    var totalAmount = 0.0
    
    @IBOutlet weak var CandyStoresGridCollectionView: UICollectionView!
    
    @IBOutlet weak var btnShoppingCart: UIButton!
    
    @IBOutlet weak var viewAssistant: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration.configure(view: self)
        presenter?.loadCandyStores()
    }
    
    func showViewAssistant() {
        viewAssistant.isHidden = false
        viewAssistant.isUserInteractionEnabled = true
        viewAssistant.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.hideViewAssistant)))
    }
    
    @objc
    func hideViewAssistant() {
        viewAssistant.isHidden = true

    }
    
    
    func setUpCollectionView(){
        CandyStoresGridCollectionView
                    .register(UICollectionViewCell.self,
                     forCellWithReuseIdentifier: "cell")
        color = btnShoppingCart.backgroundColor
            
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 8

        layout.minimumInteritemSpacing = 4

        CandyStoresGridCollectionView
                   .setCollectionViewLayout(layout, animated: true)
    }

    
    func showLoadingPopUp() {
        self.waiting(message: "Cargando CandyStores...")
    }
    
    func hideLoadingPopUp()  {
        self.closeWaiting()
    }
    
    func showToastError(error: String) {
        self.toast(message: error)
    }
    
    func setCandyStoresInCollectionView(candyStores: [CandyStore]) {
        print("tableviewdata",candyStores)
        self.candyStores = candyStores
        btnShoppingCart.backgroundColor = UIColor.lightGray
        btnShoppingCart.isEnabled = false
        CandyStoresGridCollectionView.delegate = self
        CandyStoresGridCollectionView.dataSource = self
    }
    
    
    @objc
    func plusItem(_ sender : UIButton)  {
        print("sumar producto")
        let indexPath = sender.tag
        let cellTap = cellCandyStores[indexPath]
        
        var candyStoreQuantitySelect = Int(cellTap.lblquantity.text!)!
        
        candyStoreQuantitySelect+=1
        
        cellTap.lblquantity.text = String(candyStoreQuantitySelect)
        
        let candyStoreSelect = candyStores[indexPath]
        
        totalAmount+=Double(candyStoreSelect.price) ?? 0.00
        
        btnShoppingCart.setTitle("S/\(totalAmount.truncate(places: 2))", for: .normal)
        if totalAmount == 0 {
            btnShoppingCart.backgroundColor = UIColor.lightGray
            btnShoppingCart.isEnabled = false
        }else{
            btnShoppingCart.backgroundColor =  color
            btnShoppingCart.isEnabled = true
        }
        
        print("Precio : \(candyStoreSelect.price) , total : \(totalAmount)")
    }
    @objc
    func substractionitem(_ sender : UIButton)  {
        print("restar producto")
        let indexPath = sender.tag
        let cellTap = cellCandyStores[indexPath]
        
        var candyStoreQuantitySelect = Int(cellTap.lblquantity.text!)!
        if candyStoreQuantitySelect == 0 {
            return
        }
        
        candyStoreQuantitySelect-=1
        
        cellTap.lblquantity.text = String(candyStoreQuantitySelect)
        
        let candyStoreSelect = candyStores[indexPath]
        
        totalAmount-=Double(candyStoreSelect.price) ?? 0.0
        
        btnShoppingCart.setTitle("S/\(totalAmount.truncate(places: 2))", for: .normal)
        if totalAmount == 0 {
            btnShoppingCart.backgroundColor = UIColor.lightGray
            btnShoppingCart.isEnabled = false
        }else{
            btnShoppingCart.backgroundColor = Global.blueCineplanet
            btnShoppingCart.isEnabled = true
        }
        
        print("Precio : \(candyStoreSelect.price) , total : \(totalAmount)")
    }
    @IBAction func goPay(_ sender: Any) {
        let paymentViewController = Global.storyBoard.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
        paymentViewController.amountPayable = "S/\(totalAmount.truncate(places: 2))"
        self.navigationController?.pushViewController(paymentViewController, animated: true)
    }
    
}
extension CandyStoreViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return candyStores.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellCandyStore", for: indexPath) as? CellCandyStore {
            
            let candyStore = candyStores[indexPath.row]
            
            
            cell.shadowDecorate()
            cell.lblPrice.text = "S/" + candyStore.price
            cell.btnTitle.text = candyStore.description
            cell.imageCandyStore.imageFromUrl(urlString: candyStore.image)
            
            cell.btnPlusItem.tag =  indexPath.row
            cell.btnPlusItem.addTarget(self, action: #selector(plusItem), for: .touchUpInside)
            
            cell.btnSubtractionItem.tag = indexPath.row
            cell.btnSubtractionItem.addTarget(self, action: #selector(substractionitem), for: .touchUpInside)
            
            cellCandyStores.append(cell)
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}

extension CandyStoreViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 12.0, bottom: 12, right: 8.0)
    }

  
    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
       
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
      
        return CGSize(width: widthPerItem - 8, height: 220)
    }
}
