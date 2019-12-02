//
//  EmployeeCollectionViewCell.swift
//  KGIEmployee
//
//  Created by Sembawang Housemate on 2/12/19.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import UIKit

class EmployeeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImaga: UIImageView!
    @IBOutlet weak var lblEmployeeName: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    func setupView(employee: Employee) -> () {
        
        
        lblEmployeeName.text = employee.name
        lblDepartment.text = employee.department
        lblEmail.text = employee.email
        
        
       // let image = UIImage(named: employee.imageFileName)
        
        profileImaga.image = UIImage(named: employee.imageFileName)
    }
}
