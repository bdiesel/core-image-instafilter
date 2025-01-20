//
//  ContentView.swift
//  core-image-instafilter
//
//  Created by Brian Diesel on 1/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var proceesedImage: Image?
    @State private var filterIntensity = 0.5
    
    
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                if let proceesedImage {
                    proceesedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus",
                                           description: Text("Tap to import a photo")
                    )
                }
                
                Spacer()
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                    Spacer()
                    // share the picture
                }
            }
        }
        .padding([.horizontal, .bottom])
        .navigationTitle("Instafilter")
    }
    
    func changeFilter(){
        
    }
}

#Preview {
    ContentView()
}
