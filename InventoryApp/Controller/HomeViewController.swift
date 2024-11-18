//
//  HomeViewController.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 16/11/24.
//

import UIKit

class HomeViewController: BaseVC {
    
    var data = [
        [("Create Challan", "icon_add_challan"), ("Saved Challan", "saved_challa")],
        [("Submit Challan", "submitted_challan"), ("Return Challan", "return_challan"), ("Requests", "submitted_challan")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIupdate()
        
    }
    func UIupdate() {
        mainCollectionView.register(UINib.init(nibName: "InventoryViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
}

//MARK: CollectionView
extension HomeViewController: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? InventoryViewCell else {
            return UICollectionViewCell()
        }
        let item = data[indexPath.section][indexPath.row]
        let name = item.0
        let image = UIImage(named: item.1)
        cell.configureCell(with: name, image: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = data[indexPath.section][indexPath.row]
        let name = selectedItem.0
        switch name {
        case "Create Challan":
            let vc = storyboard?.instantiateViewController(withIdentifier: "createchallanvc") as! createchallanvc
            navigationController?.pushViewController(vc, animated: true)
            
        case "Return Challan":
            let vc = storyboard?.instantiateViewController(withIdentifier: "Returnchallanvc") as! Returnchallanvc
            navigationController?.pushViewController(vc, animated: true)
            
        case "Submit Challan":
            let vc = storyboard?.instantiateViewController(withIdentifier: "submitchallanvc") as! submitchallanvc
            navigationController?.pushViewController(vc, animated: true)
            
        case "Requests":
            let vc = storyboard?.instantiateViewController(withIdentifier: "Requestvc") as! Requestvc
            navigationController?.pushViewController(vc, animated: true)
            
        case "Saved Challan":
            let vc = storyboard?.instantiateViewController(withIdentifier: "Savedchallanvc") as! Savedchallanvc
            navigationController?.pushViewController(vc, animated: true)
            
        default:
            print("No action defined for \(name)")
        }
    }

    
   //MARK: FlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let xPadding: CGFloat = 10
        let spacing: CGFloat = 10
        let rightPadding: CGFloat = 10
        let width = (collectionView.frame.width - (xPadding + rightPadding + spacing)) / 2
        return CGSize(width: width - 10, height: width - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }

}
