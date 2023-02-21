//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Dathan Felipe on 2/16/23.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    // reference the view model
    @EnvironmentObject var model:RecipeModel
    @State var showDetailView = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        let featuredRecipes = model.recipes.filter({ $0.featured })
        
        VStack(alignment: .leading, spacing: 0.0) {
            
            Text("Featured Recipes")
                .font(Font.custom("Avenir Heavy", size: 25))
                .fontWeight(.bold)
                .padding(.top, 40.0)
                .padding(.leading)
            
            GeometryReader { geo in
                
                TabView(selection: $tabSelectionIndex) {
                    
                    // loop through each recipe
                    ForEach (0..<featuredRecipes.count) { index in
                        
                        // recipe card button
                        Button(action: {
                            
                            // show the recipe detail sheet
                            self.showDetailView = true
                            
                        }, label: {
                            // recipe card
                            ZStack {
                                
                                Rectangle()
                                    .foregroundColor(.white)
                                
                                VStack(spacing: 0.0) {
                                    Image(featuredRecipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    
                                    Text(featuredRecipes[index].name)
                                        .font(Font.custom("Avenir", size: 16))
                                        .padding(5)
                                }
                            }
                        })
                        .tag(index)
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geo.size.width - 50, height: geo.size.height - 100, alignment: .center)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10.0) {
                
                Text("Preperation Time:")
                    .font(Font.custom("Avenir Heavy", size: 17))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 16))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 17))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .sheet(isPresented: $showDetailView) {
            // Show the Recipe Detail View
            RecipeDetailView(recipe: featuredRecipes[tabSelectionIndex])
        }

    }
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
