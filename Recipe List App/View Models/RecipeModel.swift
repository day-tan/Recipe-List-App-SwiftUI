//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Dathan Felipe on 2/11/23.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // create instance of DataService
        self.recipes = DataService().getLocalData()
    }
}
