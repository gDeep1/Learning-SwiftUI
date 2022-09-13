//
//  HomeScreen.swift
//  SwiftUIProject
//
//  Created by Gagandeep on 09/08/22.
//

import SwiftUI

class HomeScreenViewModel {
    let api = API()
    
    func getData() {
        
        api.fetchItems()
    }
}


struct HomeScreen: View {
    @EnvironmentObject var tabRouter: TabbarRouter
    
    var body: some View {
        ZStack {
            VStack {
                Text("Home Screen!")
                    .bold()
                    .foregroundColor(.red)
                Button("Press For Next") {
                    tabRouter.selectedTab = .profile
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipped()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
