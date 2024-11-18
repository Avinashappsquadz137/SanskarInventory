//
//  Returnchallanvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 30/07/24.
//

import UIKit

class Returnchallanvc: BaseVC {
    var data = [
        ("QR Challan", "icon_qr_code"), ("Challan No", "icon_number")]
    var qrCodeModel = QRCodeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIupdate()
    }
    func UIupdate() {
        mainCollectionView.register(UINib.init(nibName: "InventoryViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
    
}

//MARK: CollectionView
extension Returnchallanvc: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? InventoryViewCell else {
            return UICollectionViewCell()}
        let item = data[indexPath.row]
        let name = item.0
        let image = UIImage(named: item.1)
        cell.configureCell(with: name, image: image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = data[indexPath.row]
        let name = selectedItem.0
        switch name {
        case "QR Challan":
            let scannerVC = QRCodeScannerViewController()
            scannerVC.didScanQRCode = { [weak self] scannedCode in
                guard let self = self else { return }
                self.qrCodeModel.addCode(scannedCode)
                self.printAllScannedCodes()
            }
            self.navigationController?.pushViewController(scannerVC, animated: true)
        case "Challan No":
            let vc = storyboard?.instantiateViewController(withIdentifier: "Returnchallanvc") as! Returnchallanvc
            navigationController?.pushViewController(vc, animated: true)

        default:
            print("No action defined for \(name)")
        }
        
    }
    func printAllScannedCodes() {
           let allScannedCodesString = qrCodeModel.scannedCodes.joined(separator: ", ")
           print("All scanned codes: \(allScannedCodesString)")
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


