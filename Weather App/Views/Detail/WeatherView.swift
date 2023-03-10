//
//  WeatherView.swift
//  Weather App
//
//  Created by Dalveer singh on 01/01/23.
//

import SwiftUI
import WeatherKit

struct WeatherView: View {
    
    @State private var searchText = ""
    
    var searchResults:[Forecast]{
        if searchText.isEmpty{
            return Forecast.cities
        }
        else
        {
            return Forecast.cities.filter{ $0.location.contains(searchText)}
        }
    }
    
    var body: some View {
        ZStack{
            //MARK: Background
            Color.background
                .ignoresSafeArea()
            
            //MARK: Weather View
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(searchResults){ forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
            
        }
        .overlay{
            //MARK: Navigation Bar
            NavigationBar(searchText: $searchText)
        }
        .navigationBarHidden(true)
        //        .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),prompt: "Search for City")
        
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView
        {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
