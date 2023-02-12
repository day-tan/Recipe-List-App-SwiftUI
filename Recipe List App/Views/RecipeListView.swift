//
//  ContentView.swift
//  Recipe List App
//
//  Created by Dathan Felipe on 2/8/23.
//

import SwiftUI

struct RecipeListView: View {
    
    // reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationStack {
            List(model.recipes) { recipeList in
                
                NavigationLink(destination: RecipeDetailView(recipe: recipeList), label: {
                    HStack(spacing: 20.0) {
                        Image(recipeList.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(recipeList.name)
                    }
                })
            }
            .navigationTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
