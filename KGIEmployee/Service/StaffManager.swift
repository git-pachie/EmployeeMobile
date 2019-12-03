//
//  StaffManager.swift
//  KGIEmployee
//
//  Created by pachie on 03/12/2019.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import Foundation

struct StaffManager {
    let staffapiURL = "http://192.168.8.180/StaffInfoAPI/api/Staff"
    
    func performURLRequest(completion: @escaping ([EmployeeDTO]) -> ()) {
        
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            let session = URLSession(configuration: .default)
            
            let urlString = URL(string: self.staffapiURL)
            
            let task = session.dataTask(with: urlString!) { (data, response, error) in
                
                if error != nil
                {
                    print(error as Any)
                    return
                }
                
                if let safeData = data
                {
                    print(safeData)
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let decodedData =  try decoder.decode([RootObject].self, from: safeData)
                        
                        let parsedData = parseJSON(staffData: decodedData)
                        
                        DispatchQueue.main.async {
                            completion(parsedData)
                        }
                        
                        
                    } catch  {
                        print(error)
                    }
                    
                }
                
                
            }
            
            task.resume()
            
        }
    }
    
    
}


func parseJSON(staffData: [RootObject]) -> [EmployeeDTO] {
    
    var empTop = [EmployeeDTO]()
    
    for item in staffData {
        
        let department = item.Department
        
        var employeels = [Employee]()
        
        for inn in item.Staffs {
            employeels.append(Employee.init(employeeId: inn.EmployeeID, name: inn.Name, department: inn.Department, phone: inn.Phone, email: inn.Email, imageFileName: inn.ProfileImageName))
        }
        
        empTop.append(EmployeeDTO.init(departmentName: department, employees: employeels))
        
    }
    
    return empTop
    
}
