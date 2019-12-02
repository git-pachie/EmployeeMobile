//
//  StaffDetailsViewController.swift
//  KGIEmployee
//
//  Created by pachie on 02/12/2019.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import UIKit

class StaffDetailsViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDepartment: UILabel!
    
    @IBOutlet weak var labelEmail: UILabel!
    
    @IBOutlet weak var labelOfficePhone: UILabel!
    
    @IBOutlet weak var viewBG: UIView!
    
    var selectedStaff: Employee?
    let services = Services()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //let controllerWidth = self.view.bounds.width
        
        guard let selected = selectedStaff else {
            return
        }
        
        labelName.text = selected.name
        labelDepartment.text = selected.department
        labelEmail.text = selected.email
        labelOfficePhone.text = selected.phone
        
        let img = services.getimagefromdocuments(imageFileName: selected.imageFileName)
        
        profileImage.image = img
        profileImage.clipsToBounds = true
        
        profileImage.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        profileImage.layer.borderWidth = 3
        profileImage.layer.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        services.applyRounderCorder(items: [profileImage])
        
        
        
    }
    

    
}
