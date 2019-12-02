//
//  DBEmployee.swift
//  KGIEmployee
//
//  Created by Sembawang Housemate on 2/12/19.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import Foundation

class DBEmployee {
    
 static  func getemployees(completion: @escaping ([EmployeeDTO]) -> ()) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            var empDTO = [EmployeeDTO]()
            
            
            
            
            var emplistIT = [Employee]()
            
            emplistIT.append(Employee(employeeId: "E0110", name: "Archimedes Angeles", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0111.jpg"))
            
            emplistIT.append(Employee(employeeId: "E0112", name: "Ryan Robles", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0112.jpg"))
                      
            emplistIT.append(Employee(employeeId: "E0113", name: "Wilmer De Chiaz", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0113.jpg"))
                      
            emplistIT.append(Employee(employeeId: "E0114", name: "Jay Angeles", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0114.jpg"))
                      
            emplistIT.append(Employee(employeeId: "E0115", name: "Dai Der", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0115.jpg"))
                      
            emplistIT.append(Employee(employeeId: "E0116", name: "Reynaldo Zambile", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0116.jpg"))
            
            
            empDTO.append(EmployeeDTO.init(departmentName: "Information Technology", employees: emplistIT))
                      
            
            
            
            
            
            
            
            
            
            var emplistFinance = [Employee]()
            
            emplistFinance.append(Employee(employeeId: "E0110", name: "Evelyn Chye", department: "Finance", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0111.jpg"))
            
            emplistFinance.append(Employee(employeeId: "E0112", name: "Fu Shan Robles", department: "Finance", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0112.jpg"))
                      
            emplistFinance.append(Employee(employeeId: "E0113", name: "Alma De Chiaz", department: "Finance", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0113.jpg"))
                      
            emplistFinance.append(Employee(employeeId: "E0114", name: "Joyce Lock", department: "Finance", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0114.jpg"))
                      
            emplistFinance.append(Employee(employeeId: "E0115", name: "Brenda Sim", department: "Finance", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0115.jpg"))
                      
            
            
            empDTO.append(EmployeeDTO.init(departmentName: "Finance", employees: emplistFinance))
                      
            
            

            DispatchQueue.main.async {
                completion(empDTO)
            }
            
            
        }
    }
        
        
    
}
