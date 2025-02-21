//
//  RecipeAppTests.swift
//  RecipeAppTests
//
//  Created by Nupur Patel on 2/19/25.
//

import XCTest
@testable import RecipeApp

final class RecipeAppTests: XCTestCase {
    func testFetchRecipes() async throws {
        let service = RecipeService()
        do {
            let recipes = try await service.fetchRecipes()
            XCTAssertFalse(recipes.isEmpty, "Recipes should not be empty")
        } catch {
            XCTFail("Fetching recipes failed with error: \(error)")
        }
    }
}
