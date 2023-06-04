//
//  RunCardComponent.swift
//  ALP_CHASE_SE
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI

struct RunCardComponent: View {
    var date : Date
    var destination : String
    var formattedDate : String{
        // Create Date Formatter
        let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = "YY/MM/dd"

        // Convert Date to String
        return dateFormatter.string(from: date)
    }
    var body: some View {
        VStack{
            HStack{

                Text("Date : ").fontWeight(.bold)
                Text(formattedDate)
                Spacer()
            }
            HStack{
                Text("Distance : ").fontWeight(.bold)
                Text(destination)
                Spacer()
            }
        }
    }
}

struct RunCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        RunCardComponent(date:Date(), destination: "")
    }
}
