//
//  CustomersScreen.swift
//  SwiftUIProject
//
//  Created by Gagandeep on 09/08/22.
//

import SwiftUI

struct CustomersScreen: View {
    var body: some View {
        ZStack {
            Text("Customers Screen")
                .bold()
                .foregroundColor(.yellow)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipped()
    }
}

struct CustomersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CustomersScreen()
    }
}
