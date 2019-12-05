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
    
    var employees = [EmployeeDTO]()
    let services = Services()
    var stp = StaffManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        stp.performURLRequest {[weak self] (result) in
            
            guard let self = self else { return }
            
            
            
            
//            var filtered = result.filter { (emplist) -> Bool in
//                
//                var ls = [EmployeeDTO]()
//                
//                
//                var collection = emplist.employees.filter { (emp1) -> Bool in
//                    return emp1.name.contains("archimedes")
//                }
//                
//                for inn in collection
//                {
//                    var e = Employee.init(employeeId: inn.employeeId, name: inn.name, department: inn.department, phone: inn.phone, email: inn.email, imageFileName: inn.imageFileName)
//                    
//                    ls.append(EmployeeDTO.init(departmentName: inn.department, employees: <#T##[Employee]#>))
//                }
//                
//            }
            
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
    
    
    @IBAction func btnDownloadImageClicked(_ sender: Any) {
        
        for item in employees {
            for inn in item.employees {
                
                //DispatchQueue.global(qos: .userInitiated).async {
                    
                    self.stp.downloadImage(fileNameToDownload: inn.imageFileName) { (success) in
                        print("download result \(success)")
                        //sleep(10)
                   // }
                }
                
                
                //return
            }
        }
        
        
        
    }
    
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employees[section].employees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EmployeeCollectionViewCell
        
        
        cell.setupView(employee: employees[indexPath.section].employees[indexPath.item])
        
        services.applyRounderCorder(items: [cell])
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        //let height = CGFloat(200)
        let width = employeeCollectionView.bounds.width - 10
        let flow = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flow.minimumInteritemSpacing
        
        let adjwidth = (width - spaceBetweenCells) / 3
        
        let adjHeight = adjwidth * 1.30
        
        return CGSize(width: adjwidth, height: adjHeight)
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "showemployeedetails", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "showemployeedetails"
        {
            guard let indexPath = employeeCollectionView.indexPathsForSelectedItems?.first else
            {
                print("No selected item")
                
                return
            }
            
            let employee = employees[indexPath.section].employees[indexPath.item]
            
            let vc = segue.destination as! StaffDetailsViewController
            
            vc.selectedStaff = employee
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return employees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    {
        if  kind == UICollectionView.elementKindSectionHeader
        {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "departmentheader", for: indexPath) as! DepartmentHeaderReusableView
             
            
                 header.setupheader(numberofstaff: employees[indexPath.section].employees.count, departmentName: employees[indexPath.section].departmentName )
                 
                 return header
        }
        else
        {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionfooter", for: indexPath)
            return footer
        }
        
        
        
        
        
        
    }
    
    
    
}

