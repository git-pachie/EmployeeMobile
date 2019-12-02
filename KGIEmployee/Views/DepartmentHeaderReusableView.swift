//
//  DepartmentHeaderReusableView.swift
//  KGIEmployee
//
//  Created by pachie on 02/12/2019.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import UIKit

class DepartmentHeaderReusableView: UICollectionReusableView {
        
    @IBOutlet weak var labelDepartmentHeader: UILabel!
    
    func setupheader(numberofstaff: Int, departmentName: String) -> () {
        
        
        labelDepartmentHeader.text = "\(departmentName) (\(numberofstaff))"
        
    }
    
}
