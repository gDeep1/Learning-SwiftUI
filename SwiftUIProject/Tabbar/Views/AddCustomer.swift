//
//  AddCustomer.swift
//  SwiftUIProject
//
//  Created by Gagandeep on 09/08/22.
//

import SwiftUI

struct AddCustomer: View {
    var body: some View {
        ZStack {
            Text("Add Customer Screen")
                .bold()
                .foregroundColor(.green)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .clipped()
    }
}

struct AddCustomer_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomer()
    }
}
