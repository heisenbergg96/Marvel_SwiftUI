//
//  ContentView.swift
//  Appointment
//
//  Created by Vikhyath Shetty on 29/09/20.
//  Copyright © 2020 Vikhyath Shetty. All rights reserved.
//

import SwiftUI

struct AppointmentLanding: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                HeaderView()
            }
            .navigationBarTitle("Appointment", displayMode: .large)
            VStack {
                Text("Date")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentLanding()
    }
}

struct NewAppointmentButton: View {
    var body: some View {
        Button(action: {
            
        }) {
            Text("More").padding(20)
                .background(Color(.init(white: 0.9, alpha: 0.7)))
                .foregroundColor(.gray)
                .cornerRadius(25)
        }
    }
}

struct MoreButton: View {
    var body: some View {
        Button(action: {
            // your action here
        }) {
            Text("New Appointment").padding(20)
                .background(Color(.blue))
                .foregroundColor(.white)
                .cornerRadius(25)
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer(minLength: 20)
            HStack(alignment: .bottom, spacing: 20) {
                MoreButton()
                NewAppointmentButton()
                Spacer()
            }
        }.padding(.top)
    }
}
