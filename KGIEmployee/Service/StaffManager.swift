//
//  StaffManager.swift
//  KGIEmployee
//
//  Created by pachie on 03/12/2019.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import Foundation
import UIKit

extension String
{
    func encodeUrl() -> String?
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    func decodeUrl() -> String?
    {
        return self.removingPercentEncoding
    }
    
    
}

struct StaffManager {
    let staffapiURL = "http://192.168.8.180/StaffInfoAPI/api/Staff"
    let staffPhotoURL = "http://192.168.8.180/StaffPhoto/"
    
    
    
    
    func downloadImage(fileNameToDownload: String, completion: @escaping (Bool) -> ()) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            let session = URLSession(configuration: .default)
             
             var urlComponents = URLComponents()
             
             urlComponents.scheme = "http"
             urlComponents.host = "192.168.8.180"
             urlComponents.path = "/StaffPhoto/\(fileNameToDownload)"
             //self.urlComponents.
            
             //guard let x = urlComponents.url?.absoluteString else { return  }
             
            // guard let urlString = URL(string: x) else { return }
             
             print(urlComponents.url!)
             
             let task = session.dataTask(with: urlComponents.url!) { (data, response, error) in
                 
                 if error != nil
                 {
                     print("Error download image \(error!.localizedDescription)")
                     return
                 }
                 
                 let image = UIImage(data: data!)
                 let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
                 
                 let destinationPath = URL(fileURLWithPath: documentsPath).appendingPathComponent(fileNameToDownload)
                 
                 //let destinationPath = documentsPath.stringByAppendingPathComponent("filename.jpg")
                 
                 print("destinationpath \(destinationPath)")
                 
                DispatchQueue.main.async {
                    do
                     {
                         _ = try image!.jpegData(compressionQuality: 1.0)?.write(to: destinationPath, options: .atomic)
                         
                         
                         completion(true)
                     }
                     catch
                     {
                         completion(false)
                         print(error)
                     }
                    
                }
                
                 
                
                 //UIImageJPEGRepresentation(image,1.0)?.write(to: destinationPath, opti) .writeToFile(destinationPath, atomically: true)
                 print("test")
                 
             }
             task.resume()
        }
        
        
        
        
    }
    
    
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
