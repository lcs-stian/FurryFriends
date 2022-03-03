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
                Image()
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
            
            // Assemble the URL that points to the endpoint
            let url = URL(string: "https://images.dog.ceo/breeds/labrador/lab_young.JPG/")!
            
            // Define the type of data we want from the endpoint
            // Configure the request to the web site
            var request = URLRequest(url: url)
            // Ask for JSON data
            request.setValue("application/json",
                             forHTTPHeaderField: "Accept")
            
            // Start a session to interact (talk with) the endpoint
            let urlSession = URLSession.shared
            
            
            // Replaces the transparent pixel image with an actual image of an animal
            // Adjust according to your preference ☺️
            currentImage = URL(string: remoteDogImage)!
            
        }
        
        // Try to fetch a new joke
        // It might not work, so we use a do-catch block
        do {
            
            // Get the raw data from the endpoint
            let (data, _) = try await urlSession.data(for: request)
            
            // Attempt to decode the raw data into a Swift structure
            // Takes what is in "data" and tries to put it into "currentJoke"
            //                                 DATA TYPE TO DECODE TO
            //                                         |
            //                                         V
            currentJoke = try JSONDecoder().decode(DogView.self, from: data)
            
        } catch {
            print("Could not retrieve or decode the JSON from endpoint.")
            // Print the contents of the "error" constant that the do-catch block
            // populates
            print(error)
        }
        
        .navigationTitle("Dog")
        .padding()
    }
}

struct DogView_Previews: PreviewProvider {
    static var previews: some View {
        DogView()
    }
}
