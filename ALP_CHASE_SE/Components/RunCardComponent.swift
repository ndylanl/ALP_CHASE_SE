//
//  RunCardComponent.swift
//  ALP_CHASE_SE
//
//  Created by MacBook Pro on 04/06/23.
//

import SwiftUI
import Foundation

struct RunCardComponent: View {
    var date : Date
    var distance : NSNumber
    var formattedDistance : String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .up

        let str = String(describing: formatter.string(from: distance)!)
        return str
    }
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
                Text(String(formattedDistance))
                Text(" Meter")
                Spacer()
            }
        }
    }
}

struct RunCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        RunCardComponent(date:Date(), distance: 23.5 as NSNumber)
    }
}
