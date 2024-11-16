//
//  openpdfvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 31/07/24.
//

import UIKit
import PDFKit

class openpdfvc: UIViewController {
    
    var pdfURL: URL?
    @IBOutlet weak var PDFview: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pdfURL)
        PDFview.backgroundColor = UIColor.white
        setupPDFView()
        
        if let url = pdfURL {
            loadPDF(from: url)
        } else {
            print("No PDF URL provided")
        }
    }
    
    private func setupPDFView() {
        PDFview.autoScales = true
    }
    
    private func loadPDF(from url: URL) {
        DispatchQueue.global(qos: .background).async {
            if let pdfData = try? Data(contentsOf: url), let document = PDFDocument(data: pdfData) {
                DispatchQueue.main.async {
                    self.PDFview.document = document
                    self.PDFview.scaleFactor = self.PDFview.scaleFactorForSizeToFit
                }
            } else {
                DispatchQueue.main.async {
                    print("Could not create PDF document from URL: \(url)")
                }
            }
        }
    }
    
    @IBAction func backbtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func downloadPDF(_ sender: UIButton) {
        guard let url = pdfURL else {
            print("No PDF URL available for download")
            return
        }
        
        downloadAndSavePDF(from: url)
    }
    
    private func downloadAndSavePDF(from url: URL) {
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                do {
                    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
                    let savedURL = documentsURL.appendingPathComponent(url.lastPathComponent)
                    
                    if FileManager.default.fileExists(atPath: savedURL.path) {
                        try FileManager.default.removeItem(at: savedURL)
                    }
                    
                    try FileManager.default.moveItem(at: tempLocalUrl, to: savedURL)
                    
                    DispatchQueue.main.async {
                        self.presentSaveToFilesOption(fileUrl: savedURL)
                    }
                } catch {
                    print("Error saving the PDF: \(error.localizedDescription)")
                }
            } else {
                print("Error downloading the PDF: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
        downloadTask.resume()
    }
    
    private func presentSaveToFilesOption(fileUrl: URL) {
        let activityViewController = UIActivityViewController(activityItems: [fileUrl], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [.addToReadingList, .assignToContact]
        present(activityViewController, animated: true, completion: nil)
    }
}
