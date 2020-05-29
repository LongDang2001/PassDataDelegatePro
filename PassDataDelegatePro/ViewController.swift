//
//  ViewController.swift
//  PassDataDelegatePro
//
//  Created by admin on 2/23/20.
//  Copyright © 2020 Long. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var userDataName: [String] = ["Dang Ngoc Long","Dang Ngoc Long","Dang Ngoc Long","Dang Ngoc Long","Dang Ngoc Long"]
    var userDataDiaChi: [String] = ["Dai Thuy","Truc Lam","Tinh Gia","Thanh Hoa","Viet Nam"]
    var userDataImage: [String] = ["hinh1a","hinh2a","hinh3a","hinh4a","hinh5a"]
    var indexLocal: Int?
    @IBOutlet weak var hasDataFoodterView: UIView!
    @IBOutlet weak var noDataFoodterView: UIView!
    
    var hasNoData: Bool = true {
        didSet {
            if hasNoData == true {
                tableView.tableFooterView = noDataFoodterView
            } else {
                tableView.tableFooterView = hasDataFoodterView
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        indexLocal = nil
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDataName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "IDCell", for: indexPath) as? TableViewCell {
            cell.lbNameCell.text = userDataName[indexPath.row]
            cell.lbDiaChiCell.text = userDataDiaChi[indexPath.row]
            
            cell.imageView?.image = UIImage(named: userDataImage[indexPath.row])
            return cell
        }
        return TableViewCell.init()
    }
    
    @IBAction func btnDelete() {
        guard let storyboardSeconVC = storyboard?.instantiateViewController(identifier: "secondviewcontroller")  else { return }
        
        navigationController?.pushViewController(storyboardSeconVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let storyboardSeconvcIndex = storyboard?.instantiateViewController(identifier: "secondviewcontroller") as? SecondViewController else { return }
        indexLocal = indexPath.row
        
        navigationController?.pushViewController(storyboardSeconvcIndex, animated: true)
        storyboardSeconvcIndex.delegete = self
    }
    
    // selfsizing cell co dan theo noi dung
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userDataName.remove(at: indexPath.row)
//            userDataDiaChi.remove(at: indexPath.row)
//            userDataImage.remove(at: indexPath.row)
            
            //// khong can liet ke het tat ca cac data de xoa, chi can goi mot thang ra la dc
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        if userDataName.count == 0 {
            self.hasNoData = true
        } else {
            hasNoData = false
        }
    }
}

extension ViewController: passDataDelegate {
    func passData(dataName: String, dataDiaChi: String) {
        if indexLocal != nil {
            userDataName[indexLocal!] = dataName
            userDataDiaChi[indexLocal!] = dataDiaChi
        }
        tableView.reloadData()
    }
}
