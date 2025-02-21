//
//  ContentView.swift
//  RecipeApp
//
//  Created by Nupur Patel on 2/19/25.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading Recipes...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.headline)
                        .foregroundColor(.red)
                } else if viewModel.recipes.isEmpty {
                    Text("No recipes available.")
                        .font(.headline)
                        .foregroundColor(.red)
                } else {
                    TabView {
                        ForEach(viewModel.recipes) { recipe in
                            RecipeCard(recipe: recipe)
                                .padding()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                }
            }
            .background(Color.black)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 8) {
                        Image(systemName: "fork.knife")
                            .foregroundColor(.orange)
                        Text("Recipes")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundStyle(LinearGradient(colors: [.orange, .pink], startPoint: .leading, endPoint: .trailing))
                    }
                }
            }
            .task {
                await viewModel.loadRecipes()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Task {
                            await viewModel.loadRecipes()
                        }
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
    }
}
