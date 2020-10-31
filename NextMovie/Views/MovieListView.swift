//
//  MovieList.swift
//  NextMovie
//
//  Created by Miyo Alpízar on 31/10/20.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcomingState = MovieListState()
    @ObservedObject private var topRateState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    
    
    var body: some View {
        NavigationView {
            List {
                if nowPlayingState.movies != nil {
                    MoviePosterCarouselView(title: NSLocalizedString("Now Playing", comment: ""), movies: nowPlayingState.movies!)
                }else {
                    LoadingView(isLoading: nowPlayingState.isLoading, error: nowPlayingState.error) {
                        self.nowPlayingState.loadMovies(with: .nowPlaying)
                    }
                }
                
                if upcomingState.movies != nil {
                    MovieBackdropCarouselView(title: NSLocalizedString("Upcoming", comment: ""), movies: upcomingState.movies!)
                }else {
                    LoadingView(isLoading: upcomingState.isLoading, error: upcomingState.error) {
                        self.upcomingState.loadMovies(with: .upcoming)
                    }
                }
                
                if topRateState.movies != nil {
                    MovieBackdropCarouselView(title: NSLocalizedString("Top Rated", comment: ""), movies: topRateState.movies!)
                }else {
                    LoadingView(isLoading: topRateState.isLoading, error: topRateState.error) {
                        self.topRateState.loadMovies(with: .topRated)
                    }
                }
                
                if popularState.movies != nil {
                    MovieBackdropCarouselView(title: NSLocalizedString("Popular", comment: ""), movies: popularState.movies!)
                }else {
                    LoadingView(isLoading: popularState.isLoading, error: popularState.error) {
                        self.popularState.loadMovies(with: .popular)
                    }
                }
            }.navigationTitle("The Movies")
            .onAppear {
                self.nowPlayingState.loadMovies(with: .nowPlaying)
                self.upcomingState.loadMovies(with: .upcoming)
                self.topRateState.loadMovies(with: .topRated)
                self.popularState.loadMovies(with: .popular)
            }
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
