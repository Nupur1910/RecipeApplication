//
//  ImageCache.swift
//  RecipeApp
//
//  Created by Nupur Patel on 2/19/25.
//
import UIKit

class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSURL, UIImage>()

    func getImage(for url: URL) async throws -> UIImage {
        if let cachedImage = cache.object(forKey: url as NSURL) {
            return cachedImage
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else { throw URLError(.cannotDecodeContentData) }

        cache.setObject(image, forKey: url as NSURL)
        return image
    }
}

