//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Dathan Felipe on 2/12/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(recipe.ingredients) { item in
                        Text("• " + item.name)
                    }
                    
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(/*@START_MENU_TOKEN@*/.bottom, 5.0/*@END_MENU_TOKEN@*/)
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .navigationBarTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // create dummy recipe to pass it into detail view to get a live preview
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
