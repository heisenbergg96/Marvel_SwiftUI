//
//  ContentView.swift
//  AppleWatchUI
//
//  Created by Vikhyath Shetty on 01/10/20.
//  Copyright © 2020 Vikhyath Shetty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var index = "Captain America"
    
    var body: some View {
        
        ZStack {
            
            Color.black.opacity(0.06).edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // Nav bar
                NavBar()
                
                // welcome and shit
                WelcomeView()
                
                // Filter view horizontal
                FilterView()
                
                // Main horizontal view with all the image and name....
                MainView()
                
                Spacer(minLength: 0)
                
                // Tab bar
                TabBarView()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}



struct Character: Identifiable, Hashable {
    
    var id: Int
    var title: String
    var image: String
    var color: String
    var price: String
}


var data: [Character] = [

    Character(id: 0, title: "Captain", image: "cap", color: "blue", price: "$100"),
    Character(id: 1, title: "Iron man", image: "ironman", color: "red", price: "$100"),
    Character(id: 2, title: "Thor", image: "thor", color: "violet", price: "$100"),
    Character(id: 3, title: "Hulk", image: "hulk", color: "green", price: "$100")
]

struct NavBar: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Image(systemName: "icons8-search-150")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.horizontal)
            }
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct WelcomeView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Welcome!")
                Text("Discover")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                
            }) {
                Image(systemName: "ic_contact_add")
                    .renderingMode(.template)
                    .frame(height: 48)
                    .font(.title)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }
}

struct FilterView: View {
    
    private let menu = ["Captain America", "Iron man", "Thor", "Hulk"]
    
    @State private var index = "Captain America"
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 25) {
                ForEach(menu, id: \.self) { i in
                    Button(action: {
                        self.index = i
                    }) {
                        Text(i)
                            .foregroundColor(self.index == i ? Color(.orange) : Color.black.opacity(0.6))
                            .fontWeight(.bold)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MainView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(data, id: \.self) { i in
                    
                    ZStack(alignment: .bottom) {
                        
                        Color.black.frame(height: UIScreen.main.bounds.height/3,
                                          alignment: .bottom)
                            .cornerRadius(20)
                        
                        VStack(spacing: 15) {
                            
                            Image(i.image)
                                .frame(width: UIScreen.main.bounds.width / 2)
                                .cornerRadius(20)
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text(i.title)
                                    
                                    Text("Marvel character")
                                        .fontWeight(.bold)
                                        .font(.title)
                                }
                                .foregroundColor(.white)
                                
                                Spacer(minLength: 16)
                                
                                Button(action: {
                                    
                                }) {
                                    Image("plus")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.orange)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 25)
        }
    }
}

struct TabBarView: View {
    
    @State var tab = 0
    
    var body: some View {
        HStack {
            
            Button(action: {
                self.tab = 0
            }) {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(self.tab == 0 ? Color.black : Color.black.opacity(0.25))
                
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.tab  = 1
            }) {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(self.tab == 1 ? .black : Color.black.opacity(0.25))
                
            }
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.tab = 2
            }) {
                Image(systemName: "heart")
                    .font(.title)
                    .foregroundColor(self.tab == 2 ? .black : Color.black.opacity(0.25))
                
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 30)
        .padding(.bottom, inset)
        .background(Color.white)
        .clipShape(CShape())
    }
    
    private var inset: CGFloat {
        
        let bottomInsets = UIApplication.shared.windows.first?.safeAreaInsets
        
        let bottomInset = (bottomInsets?.bottom == 0 ? 15 : bottomInsets!.bottom + 10)
        return bottomInset
    }
}


struct CShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 45, height: 45))
        
        return Path(path.cgPath)
    }
}
