//
//  ProfileScreen.swift
//  SwiftUIProject
//
//  Created by Gagandeep on 09/08/22.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        ZStack {
            Text("Profile Screen")
                .bold()
                .foregroundColor(.cyan)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipped()
        
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
