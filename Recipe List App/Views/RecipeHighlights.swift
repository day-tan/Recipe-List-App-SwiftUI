//
//  RecipeHighlightsView.swift
//  Recipe List App
//
//  Created by Dathan Felipe on 2/21/23.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        
        // loop through the highlights and build the string
        for index in 0..<highlights.count {
            
            // if last item, don't add coma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }
            
            else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 16))
    }
}

struct RecipeHighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test", "test"])
    }
}
