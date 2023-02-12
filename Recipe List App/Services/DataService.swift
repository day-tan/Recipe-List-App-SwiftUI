//
//  DataService.swift
//  Recipe List App
//
//  Created by Dathan Felipe on 2/11/23.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Recipe] {
        
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if pathString is not nil
        if let path = pathString {
            
            // create url object
            let url = URL(filePath: path)
            
            // create data object with url data
            do {
                let data = try Data(contentsOf: url)
                
                // decode json data
                let decoder = JSONDecoder()
                
                do {
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                    
                    // add unique IDs
                    for recipeID in recipeData {
                        recipeID.id = UUID()
                    }
                    
                    return recipeData
                }
                
                catch {
                    // error decoding data
                    print(error)
                }
            }
            
            catch {
                //error getting data
                print(error)
            }
            
        }
        return [Recipe]()
    }
}
