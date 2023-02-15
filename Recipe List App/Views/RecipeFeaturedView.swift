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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
    }
}
