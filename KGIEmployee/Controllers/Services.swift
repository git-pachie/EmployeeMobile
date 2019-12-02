//
//  Services.swift
//  KGIEmployee
//
//  Created by pachie on 02/12/2019.
//  Copyright © 2019 boopbayssoftware. All rights reserved.
//

import Foundation
import UIKit

class Services {
    
    func getimagefromdocuments(imageFileName: String) -> UIImage {
        
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask    = FileManager.SearchPathDomainMask.userDomainMask
        let paths               = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        
        var image = UIImage(named: "noprofile")
        
        if let dirPath          = paths.first
        {
           let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent(imageFileName)
            
            image    = UIImage(contentsOfFile: imageURL.path)
            
           // Do whatever you want with the image
            
            //let finalImage = UIImage(named: image)
            
            //print(imageURL)
            
            guard image != nil else {
                
                return UIImage(named: "noprofile")!
                
               // return
                
                
            }
            
            
            
            return image!
        }
        
        return image!
        
        //return nil
        
    }
}
