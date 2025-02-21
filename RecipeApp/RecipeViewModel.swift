//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Nupur Patel on 2/19/25.
//
import Foundation
import SwiftUI

@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service = RecipeService()

    func loadRecipes() async {
        isLoading = true
        errorMessage = nil
        do {
            recipes = try await service.fetchRecipes()
        } catch {
            errorMessage = "Failed to load recipes :(\nPlease try again later"
        }
        isLoading = false
    }
}
