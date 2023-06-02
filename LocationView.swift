//
//  LocationView.swift
//  LittleLemonReservation
//
//  Created by Vitalie Stinca on 02.06.2023.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var model: Model
    
    // The body of this view, which consists of:
    // - A logo image at the top
    // - A title that changes based on the value of `model.displayingReservationForm`
    // - A list of restaurants, each of which can be clicked to navigate to a reservation form for that restaurant
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding(.top, 50)
            
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location")
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            
            NavigationView {
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                .listStyle(.plain)
            }
        }
        .padding(.top, -10)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView().environmentObject(Model())
    }
}
