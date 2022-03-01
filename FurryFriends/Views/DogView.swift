//
//  DogView.swift
//  FurryFriends
//
//  Created by Suzanne Tian on 2022-03-01.
//

import SwiftUI

struct DogView: View {
    
    //MARK: Stored properties
    
    @State var currentImage = URL(string: "https://www.russellgordon.ca/lcs/miscellaneous/transparent-pixel.png")!
    
    //MARK: Computed properties
    
    var body: some View {
        
        VStack {
            
            RemoteImageView(fromURL: currentImage)
                .padding(30)
            
            
            Image(systemName: "heart.circle")
                .font(.largeTitle)
            
            Button(action: {
                print("I've been pressed.")
            }, label: {
                Text("Another one!")
            })
                .buttonStyle(.bordered)
            
            HStack {
                Text("Favourites")
                    .bold()
                
                Spacer()
            }
            
            List {
                
                RemoteImageView(fromURL: currentImage)
                
            }
            
            
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.primary, lineWidth: 4)
            )
            .padding(10)
            
            Spacer()
            
        }
        
        
        
        
        
        .task {
            
            let remoteDogImage = "https://images.dog.ceo/breeds/labrador/lab_young.JPG"
            
            // Replaces the transparent pixel image with an actual image of an animal
            // Adjust according to your preference ☺️
            currentImage = URL(string: remoteDogImage)!
            
        }
        
        
        .navigationTitle("Dog")
        
    }
}

struct DogView_Previews: PreviewProvider {
    static var previews: some View {
        DogView()
    }
}
