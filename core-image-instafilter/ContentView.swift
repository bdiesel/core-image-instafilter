//
//  ContentView.swift
//  core-image-instafilter
//
//  Created by Brian Diesel on 1/19/25.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var proceesedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var selectedItem: PhotosPickerItem?
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let proceesedImage {
                        proceesedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage: "photo.badge.plus",
                                               description: Text("Tap to import a photo")
                        )
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)
    
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
    
    func loadImage(){
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type:
                Data.self) else {return}
            guard let inputImage = UIImage(data: imageData) else { return }
        }
    }
}

#Preview {
    ContentView()
}
