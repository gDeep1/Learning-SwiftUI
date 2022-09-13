//
//  RoofPricingScreen.swift
//  SwiftUIProject
//
//  Created by Gagandeep on 09/08/22.
//

import SwiftUI

struct RoofPricingScreen: View {
    var body: some View {
        ZStack {
            Text("Roof Pricing Screen")
                .bold()
                .foregroundColor(.pink)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipped()
        
    }
}

struct RoofPricingScreen_Previews: PreviewProvider {
    static var previews: some View {
        RoofPricingScreen()
    }
}
