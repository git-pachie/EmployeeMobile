//
//  ViewController.swift
//  KGIEmployee
//
//  Created by Sembawang Housemate on 2/12/19.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var employeeCollectionView: UICollectionView!
    // var clsDB: DBEmployee?
    
    var employees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       // clsDB = DBEmployee()
        
        //clsDB = DBEmployee()
        
        DBEmployee.getemployees {[weak self] (result) in
            
            guard let self = self else { return }
            
            self.employees = result
            
            self.employeeCollectionView.reloadData()
            
        }
        
    }
    
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EmployeeCollectionViewCell
        
        
        cell.setupView(employee: employees[indexPath.item])
        
        applyRounderCorder(items: [cell])
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let height = CGFloat(200)
        let width = employeeCollectionView.bounds.width
        let flow = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flow.minimumInteritemSpacing
        
        let adjwidth = (width - spaceBetweenCells) / 2
        
        return CGSize(width: adjwidth, height: height)
    }
    
    
    func applyRounderCorder(items: [UIView]) -> () {
        
        for item in items {
            
            item.layer.cornerRadius = 10
            
            
        }
        
    }
    
    
}

