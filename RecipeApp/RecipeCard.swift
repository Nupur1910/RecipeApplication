//
//  RecipeCard.swift
//  RecipeApp
//
//  Created by Nupur Patel on 2/20/25.
//
import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe
    @State private var image: UIImage?

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 10)
            } else {
                ProgressView()
                    .frame(height: 300)
            }
            Text(recipe.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 8)
                .foregroundStyle(LinearGradient(colors: [.orange, .pink], startPoint: .leading, endPoint: .trailing))
           
            Text(recipe.cuisine)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.bottom, 8)
        }
        .padding()
        .background(Color.black)
        .task {
            if let url = recipe.photoURLLarge ?? recipe.photoURLSmall {
                image = try? await ImageCache.shared.getImage(for: url)
            }
        }

    }
}
