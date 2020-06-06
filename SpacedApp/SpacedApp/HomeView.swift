//
//  ContentView.swift
//  SpacedApp
//
//  Created by Anderson on 30/03/20.
//  Copyright © 2020 Anderson Lentz. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var trendingItems:[TrendingItem] = [
        TrendingItem(imageName: "roberto-nickson-g-549146-unsplash", title: "Ophiuchi", subtitle: "KADUNA", buttonTitle: "0.4 BTC"),
        TrendingItem(imageName: "kenny-luo-516116-unsplash", title: "Ophiuchi", subtitle: "KADUNA", buttonTitle: "0.4 BTC"),
        TrendingItem(imageName: "simone-hutsch-699861-unsplash", title: "Ophiuchi", subtitle: "KADUNA", buttonTitle: "0.4 BTC")
    ]
    
    @State var x: CGFloat = 30
    @State var count: Int = 0
    @State var screen = UIScreen.main.bounds.width - 60

    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }

    var body: some View {
        VStack() {
            header
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.black)
    }
        
    private var header: some View {
        TabView {
            ZStack(alignment: .top) {
            
                GeometryReader { geometry in

                    VStack(alignment: .leading) {
                        HStack {
                            Text("Discover")
                                .foregroundColor(.white)
                                .font(.system(size: 34))
                                .bold()

                            Spacer()

                            Profile(image: "kal-loftus-unsplash", style: .small)

                        }
                        HStack {
                            Text("Trending locations today")
                                .foregroundColor(Color(red: 213/255, green: 217/255, blue: 223/255))
                                .font(.system(size: 16))
                        }
                    }

                    .padding(.top, 56)
                    .padding(.horizontal, 30)

                    HStack(spacing: 10) {
                        ForEach((0...2), id: \.self) {
                            TrendingCard(trendingItem: self.trendingItems[$0],size: CGSize(width:self.screen,height: 372))
                                .scaleEffect($0 == self.count ? 1 : 0.96)
                                .offset(x: self.x)
                                .highPriorityGesture(DragGesture()
                                    .onChanged({ value in
                                        if value.translation.width > 0 {
                                            self.x = value.location.x
                                        } else {
                                            self.x = value.location.x - self.screen
                                        }
                                    })
                                    .onEnded({ value in
                                        if value.translation.width > 0 {
                                            if value.translation.width > ((self.screen) / 2) &&
                                                Int(self.count) != 0 {
                                                self.count -= 1

                                                if self.count == 0 { //if first card
                                                   self.x = 30 // same padding horizontal of  Discover
                                                } else {
                                                    self.x = -((self.screen - 20) * CGFloat(self.count))
                                                }
                                            } else {
                                                self.x = -((self.screen - 20) * CGFloat(self.count))
                                            }
                                        } else {
                                            if -value.translation.width > ((self.screen) / 2) &&
                                                Int(self.count) != (self.trendingItems.count - 1) {
                                                self.count += 1

                                                if self.count == self.trendingItems.count - 1 { //last element
                                                    self.x = -((self.screen - 5) * CGFloat(self.count))
                                                } else {
                                                    self.x = -((self.screen - 20) * CGFloat(self.count))
                                                }
                                            } else {
                                                // if here user tried to scroll last card
                                                self.x = -((self.screen - 5) * CGFloat(self.count))
                                            }
                                        }
                                    })
                                )
                        }
                    }
                    .animation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5))
                    .padding(.top, 147)


                }
            }
                .background(Color.black)
                .edgesIgnoringSafeArea([.top, .bottom])
                .tabItem {
                    Image("Home")
                }

            FakeView1()
                .tabItem {
                     Image("location")
            }

            FakeView1()
                .tabItem {
                     Image("Search")
                }

            FakeView1()
                .tabItem {
                     Image("Account")
                }
        }
    }

    struct FakeView1: View {
        var body: some View {
            Color.black
        }
    }

    struct FakeView2: View {
        var body: some View {
            Color.black
        }
    }

    struct FakeView3: View {
        var body: some View {
            Color.black
        }
    }
    
    func getMid() -> Int {
        return trendingItems.count / 2
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
    
}
