//
//  ContentView.swift
//  Recipe List App
//
//  Created by Dathan Felipe on 2/8/23.
//

import SwiftUI

struct RecipeListView: View {
    
    // reference the view model
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                Text("All Recipes")
                    .font(Font.custom("Avenir Heavy", size: 25))
                    .fontWeight(.bold)
                    .padding(.top, 40.0)
                
                ScrollView {
                    
                    LazyVStack(alignment: .leading) {
                        
                        ForEach(model.recipes) { recipeList in
                            
                            NavigationLink(destination: RecipeDetailView(recipe: recipeList), label: {
                                
                                // MARK: Row Item
                                HStack(spacing: 20.0) {
                                    Image(recipeList.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    
                                    VStack(alignment: .leading) {
                                        Text(recipeList.name)
                                            .font(Font.custom("Avenir Heavy", size: 17))
                                            .foregroundColor(.black)
                                        RecipeHighlights(highlights: recipeList.highlights)
                                            .foregroundColor(.black)
                                    }
                                }
                            })
                        }
                    }
                }
            }
            .padding(.leading)
            .toolbar(.hidden)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
