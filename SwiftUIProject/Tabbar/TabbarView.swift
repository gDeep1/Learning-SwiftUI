//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by Gagandeep on 09/08/22.
//

import SwiftUI

enum TabbarItems {
    case home
    case customers
    case addCustomer
    case pricing
    case profile
}

class TabbarRouter: ObservableObject {
   @Published var selectedTab: TabbarItems = .home
}

struct TabbarView: View {
    @StateObject private var router = TabbarRouter()
    
    init() {
       // UITabBar.appearance().backgroundColor = .white
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundColor = UIColor(Color.gray)
        standardAppearance.shadowColor = .black
        
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = UIColor(Color.gray)
        itemAppearance.selected.iconColor = UIColor(Color.red)
        
        standardAppearance.inlineLayoutAppearance = itemAppearance
        standardAppearance.stackedLayoutAppearance = itemAppearance
        standardAppearance.compactInlineLayoutAppearance = itemAppearance
        UITabBar.appearance().standardAppearance = standardAppearance
    }
    
    var body: some View {
        TabView(selection: $router.selectedTab) {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(TabbarItems.home)
                .environmentObject(router)
            CustomersScreen()
                .tabItem {
                    Label("Customers", systemImage: "person.2")
                }
                .tag(TabbarItems.customers)
                .environmentObject(router)
            AddCustomer()
                .tabItem {
                    Label("", systemImage: "plus")
                }
                .tag(TabbarItems.addCustomer)
                .environmentObject(router)
            RoofPricingScreen()
                .tabItem {
                    Label("Pricing", systemImage: "dollarsign.circle")
                }
                .tag(TabbarItems.pricing)
                .environmentObject(router)
            ProfileScreen()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
                .tag(TabbarItems.profile)
                .environmentObject(router)
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
            .environmentObject(TabbarRouter())
    }
}
