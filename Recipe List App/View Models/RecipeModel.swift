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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        
        if ingredient.num != nil {
            
            // get a single serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            // get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // get the whole portion if numerator > denominator
            if numerator >= denominator {
                
                // calculate whole portions
                wholePortions = numerator / denominator
                
                // calculate remainder
                numerator %= denominator
                
                // assign to portion string
                portion += String(wholePortions)
            }
            
            // express the remainder as a fraction
            if numerator > 0 {
                
                // assign remainder as fraction to the portion string
                if wholePortions > 0 {
                    portion += " "
                }
                
                else {
                    portion += ""
                }
                
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            // check if need to be plural
            if wholePortions > 1 {
                
                // add appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                
                else {
                    unit += "s"
                }
                
            }
            
            if ingredient.num == nil && ingredient.denom == nil {
                portion += ""
            }
            
            else {
                portion += " "
            }
            
            return portion + unit
        }
        
        return portion
    }
}
