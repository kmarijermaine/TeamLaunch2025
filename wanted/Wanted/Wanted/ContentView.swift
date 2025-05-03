//
//  ContentView.swift
//  Wanted
//
//  Created by student on 5/3/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State private var renderedPoster: Image?
    @AppStorage("crime") private var crime = "Train Robbery, Bank Robbery, Snake Oil Salesman"
    @AppStorage("reward") private var reward = "$1000"
    @AppStorage("contact") private var contact = "1-800-GOTCHA"
    @AppStorage("paperOpacity") private var paperOpacity = 0.75
    
    @State private var inputPickerItem: PhotosPickerItem?
    @State private var inputImage : Image?
    
    var body: some View {
        NavigationStack{
            Form {
                renderedPoster?
                    .resizable()
                    .scaledToFill()
                    .listRowInsets(EdgeInsets())
                Section {
                    PhotosPicker("Select an Image", selection: $inputPickerItem, matching: .images)
                }
                Section("What was the crime ?") {
                    TextField("Enter a crime", text: $crime, axis: .vertical)
                }
                Section("What is the reward?"){
                    TextField("Enter a reward", text: $reward, axis: .vertical)
                }
                Section("Who to contact"){
                    TextField("Enter contact", text: $contact, axis: .vertical)
                }
                Section("Paper Opacity") {
                    Slider(value: $paperOpacity)
                }
                    
            }
            .listSectionSpacing(.compact)
            .scrollDismissesKeyboard(.interactively)
            .navigationTitle("Desgin your poster")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if let renderedPoster {
                    ShareLink(item: renderedPoster, preview: SharePreview("Wanted for \(crime)",image: renderedPoster ))
                }
            }
            .onChange(of: [crime, reward, contact, String(paperOpacity)], render)
            .onChange(of: inputPickerItem) {
                Task {
                    inputImage = try? await
                    inputPickerItem?.loadTransferable(type: Image.self)
                    render()
                }
            }
        }
        .onAppear(perform: render)
    }
    
    @MainActor func render() {
        let renderer = ImageRenderer(content: WantedPosterView(image: inputImage, crime: crime, reward: reward, contact: contact, paperOpacity: paperOpacity))
        renderer.scale = 3
        if let image = renderer.uiImage {
            renderedPoster = Image(uiImage: image)
        }
        
    }
}

#Preview {
    ContentView()
}
