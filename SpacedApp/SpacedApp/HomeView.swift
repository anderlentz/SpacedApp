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

    @State var x: CGFloat = 0
    @State var count: Int = 0
    @State var screen = UIScreen.main.bounds.width - 60

    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }

    var body: some View {
        TabView {
            VStack(alignment: .leading) {
                self.header
                    .padding(.top, 12)
                    .padding(.horizontal, 15)

                List {
                    self.carouselView
                    self.feelingAdventurousRow
                }
                .listStyle(PlainListStyle())
        }
            .edgesIgnoringSafeArea([.bottom])
            .tabItem { Image("Home") }

        FakeView1()
            .tabItem { Image("location") }

        FakeView1()
            .tabItem { Image("Search") }

        FakeView1()
            .tabItem { Image("Account") }
        }

        .preferredColorScheme(.dark)
        .onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }
    private var carouselView: some View {
        let drag = DragGesture(minimumDistance: 60, coordinateSpace: .local)
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
                       self.x = 0 // same padding horizontal of  Discover
                    } else {
                        self.x = -((self.screen ) * CGFloat(self.count))
                    }
                } else {
                    self.x = -((self.screen - 20) * CGFloat(self.count))
                }
            } else {
                if -value.translation.width > ((self.screen) / 2) &&
                    Int(self.count) != (self.trendingItems.count - 1) {
                    self.count += 1

                    if self.count == self.trendingItems.count - 1 { //last element
                        self.x = -((self.screen + 5) * CGFloat(self.count))
                    } else {
                        self.x = -((self.screen) * CGFloat(self.count))
                    }
                } else {
                    // if here user tried to scroll last card
                    self.x = -((self.screen + 10) * CGFloat(self.count))
                }
            }
        })

        return (
            HStack(spacing: 10) {
                ForEach((0...2), id: \.self) { count in
                    TrendingCard(
                        trendingItem: self.trendingItems[count],
                        size: CGSize(width:self.screen, height: 372)
                    )
                    .scaleEffect(count == self.count ? 1 : 0.96)
                    .offset(x: self.x)
                }
            }
            .highPriorityGesture(drag)
            .animation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.5))
        )
    }

    private var header: some View {
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
    }

    private var innerTitle: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Feeling Adventurous?")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .bold()
            Text("Get Inspiration from these trending\ncategories")
                .foregroundColor(.white)
                .font(.system(size: 16))
        }
    }

    private var feelingAdventurousRow: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                self.innerTitle
                    .frame(minWidth: 0, minHeight: 0, maxHeight: 200)
                self.trendingCategories
                    .frame(minWidth: 0, minHeight: 200, maxHeight: 200)
            }
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
        }
    }

    private var trendingCategories: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center,spacing: 10) {
                Image("nature")
                    .resizable()
                    .overlay(
                        Text("Nature")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                    )
                    .onTapGesture {
                        print("Nature")
                    }
                Image("futuristic")
                    .resizable()
                    .overlay(
                        Text("Futuristic")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                    )
                    .onTapGesture {
                        print("Futuristic")
                    }
            }
            HStack(alignment: .center,spacing: 10) {
                Image("party")
                    .resizable()
                    .overlay(
                        Text("Party")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                    )
                    .onTapGesture {
                        print("Party")
                    }
                Image("green")
                    .resizable()
                    .overlay(
                        Text("Green")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 18))
                    )
                    .onTapGesture {
                        print("Green")
                    }
            }
        }
    }

    struct FakeView1: View {
        var body: some View {
            //Color.black
            Text("Put layout here")
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
