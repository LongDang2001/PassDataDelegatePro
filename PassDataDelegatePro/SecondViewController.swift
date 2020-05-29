//
//  SecondViewController.swift
//  PassDataDelegatePro
//
//  Created by admin on 2/23/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit
protocol passDataDelegate {
    func passData(dataName: String, dataDiaChi: String)
}

class SecondViewController: UIViewController {
    @IBOutlet weak var txtNameSecond: UITextField!
    @IBOutlet weak var txtDiaChiSecond: UITextField!
    var delegete: passDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func backToTable() {
        guard let dataDelegateName = txtNameSecond.text else { return }
        guard let dataDelegateDiaChi = txtDiaChiSecond.text else { return }
        
        if dataDelegateDiaChi.trimmingCharacters(in: .whitespaces).isEmpty && dataDelegateName.trimmingCharacters(in: .whitespaces).isEmpty {
            
        } else {
            delegete?.passData(dataName: dataDelegateName, dataDiaChi: dataDelegateDiaChi)
        }
        navigationController?.popViewController(animated: true)
    }
    

}
