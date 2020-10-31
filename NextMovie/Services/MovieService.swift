//
//  MovieService.swift
//  NextMovie
//
//  Created by Miyo Alpízar on 30/10/20.
//

import Foundation

protocol MovieService {
    
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping(Result<MovieResponse, MovieError>) -> ())
    func fetchMovie(id: Int, completion: @escaping(Result<Movie, MovieError>) -> ())
    func seacrhMovie(query: String, completion: @escaping(Result<MovieResponse, MovieError>) -> ())
    
}

enum MovieListEndpoint: String {
    case nowPlaying = "now_playing"
    case upcomig
    case topRated = "top_rated"
    case popular
    var description: String {
        switch self {
        case .nowPlaying:
            return NSLocalizedString("Now Playing", comment: "")
        case .upcomig:
            return NSLocalizedString("Upcoming", comment: "")
        case .topRated:
            return NSLocalizedString("Top Rated", comment: "")
        case .popular:
            return NSLocalizedString("Popular", comment: "")
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case seralizationError
    var localizedDescription: String {
        switch self {
        case .apiError:
            return NSLocalizedString("Failed to fecth data", comment: "")
        case .invalidEndpoint:
            return NSLocalizedString("Invalid endpoint", comment: "")
        case .invalidResponse:
            return NSLocalizedString("Invalid response", comment: "")
        case .noData:
            return NSLocalizedString("No data", comment: "")
        case .seralizationError:
            return NSLocalizedString("Failed to decode data", comment: "")
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}
