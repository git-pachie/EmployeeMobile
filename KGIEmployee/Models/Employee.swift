//
//  Employee.swift
//  KGIEmployee
//
//  Created by Sembawang Housemate on 2/12/19.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import Foundation

struct Staff: Decodable
{
    let EmployeeID: String
    let Name: String
    let Department: String
    let Email: String
    let Phone: String
    let ProfileImageName: String
}

struct RootObject: Decodable
{
    let Department: String
    let Staffs: [Staff]
}

class Employee {
    let employeeId: String
    let name: String
    let department: String
    let phone: String
    let email: String
    let imageFileName: String
    
    init(employeeId: String, name: String, department: String, phone: String, email: String, imageFileName: String) {
        self.employeeId = employeeId
        self.name = name
        self.department = department
        self.phone = phone
        self.email = email
        self.imageFileName = imageFileName
    }
}

class EmployeeDTO {
    let departmentName: String
    let employees: [Employee]
    
    init(departmentName: String, employees: [Employee]) {
        self.departmentName = departmentName
        self.employees = employees
    }
}
