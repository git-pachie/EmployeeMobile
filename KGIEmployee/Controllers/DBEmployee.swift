//
//  DBEmployee.swift
//  KGIEmployee
//
//  Created by Sembawang Housemate on 2/12/19.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import Foundation

class DBEmployee {
    
 static  func getemployees(completion: @escaping ([Employee]) -> ()) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            var empList = [Employee]()
            
            empList.append(Employee(employeeId: "E0110", name: "Archimedes Angeles", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0111"))
            
           
            empList.append(Employee(employeeId: "E0112", name: "Ryan Robles", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0111"))
                      
            empList.append(Employee(employeeId: "E0113", name: "Wilmer De Chiaz", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0111"))
                      
            
            empList.append(Employee(employeeId: "E0114", name: "Jay Angeles", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0111"))
                      
            empList.append(Employee(employeeId: "E0115", name: "Dai Der", department: "Information Technology", phone: "6308 8888", email: "archimedes.angeles@gmail.com", imageFileName: "E0111"))
                      
            
            
            DispatchQueue.main.async {
                completion(empList)
            }
            
            
        }
    }
        
        
    
}