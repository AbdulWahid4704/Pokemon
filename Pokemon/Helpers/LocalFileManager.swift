//
//  LocalFileManager.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 27/06/2025.
//

import Foundation
import UIKit

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    func saveImage(_ image: UIImage, name: String, in path: String = "") {
        
        // Convert image to data, ensure path exists
        guard
            let data = image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(in: path, name: name) else { return }
        
        do {
            try data.write(to: path)
        } catch let error {
            print(error.localizedDescription)
            print("Error saving image")
        }
        
    }
    
    func getImage(name: String, from path: String = "") -> UIImage? {
        
        guard
            let path = getPathForImage(in: path, name: name),
            FileManager.default.fileExists(atPath: path.path())
        else {
            print("Path doesnt exist")
            return nil
        }
        
        return UIImage(contentsOfFile: path.path())
        
    }
    
    func deleteImage(name: String, from path: String = "") {
        
        guard
            let path = getPathForImage(in: path, name: name),
            FileManager.default.fileExists(atPath: path.path())
        else {
            print("Path doesnt exist")
            return
        }
        
        do {
            try FileManager.default.removeItem(at: path)
        } catch {
            
            print("COuldnt delete image")
            print(error.localizedDescription)
            
        }
        
    }
    
    
    func getPathForImage(in path: String = "", name: String) -> URL? {
        
        // Get documents directory
        let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        // get custom path directory
        let folderDirectory = docDirectory?.appending(path: path)
        
        guard let folderDirectory = folderDirectory else { return nil }
        
        //create directory if first time, else go ahead
        do {
             try FileManager.default.createDirectory(at: folderDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error.localizedDescription)
            print("folder already exists")
        }
        
        // append image path, return
        let path = folderDirectory.appending(path: "\(name).jpg")

        return path
    }
    
}
