//
//  LocalFileManager.swift
//  Pokemon
//
//  Created by Rusaab Abdul Wahid on 02/07/2025.
//

import Foundation
import UIKit

class NotificationImageManager {
    
    static let instance = NotificationImageManager()
    
    func getData(url: URL, completion: @escaping (Data?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print(error?.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data exists")
                return
            }
            
            completion(data)
            
        }.resume()
        
        
        
    }
    
    func downloadImage(url: URL, completion: @escaping (URL?) -> Void) {
        getData(url: url) { data in
            if let data = data {
                let localURL = self.saveData(data, name: "notification.jpg", in: "documents")
                completion(localURL)
            } else {
                completion(nil)
            }
        }
    }
    
    // store it locally in tmp
    // return the path of the image
    
    
    func saveData(_ data: Data, name: String, in path: String = "") -> URL?{
        
        // Convert image to data, ensure path exists
        guard
            let path = getPathForImage(in: path, name: name) else { return nil }
        
        do {
            try data.write(to: path)
            return path
        } catch let error {
            return nil
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
