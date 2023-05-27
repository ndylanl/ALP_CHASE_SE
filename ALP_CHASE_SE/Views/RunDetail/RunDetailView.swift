//
//  RunDetailView.swift
//  ALP_CHASE_SE
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI

struct RunDetailView: View {
    
    var run: Run
    @StateObject private var controller : RunDetailViewController
    
    init(run: Run) {
        self.run = run
        self._controller = StateObject(wrappedValue: RunDetailViewController(run: run))
    }
    
    let maxHeight = UIScreen.main.bounds.size.height
    let maxWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        VStack {
            MapView(controller: controller).frame(width: maxWidth, height: ((maxHeight * 3) / 4))
            
            VStack{
                HStack{
                    Text("Distance").fontWeight(.bold)
                    Spacer()
                    Text(controller.distanceLabel)
                }
                
                HStack{
                    Text("Date").fontWeight(.bold)
                    Spacer()
                    Text(controller.dateLabel)
                }
                
                HStack{
                    Text("Pace").fontWeight(.bold)
                    Spacer()
                    Text(controller.paceLabel)
                }
                
                HStack{
                    Text("Time").fontWeight(.bold)
                    Spacer()
                    Text(controller.timeLabel)
                }
            }.padding(20).onAppear{
                UINavigationBar.appearance().barTintColor = UIColor.white //changes the Bar Tint Color

            }
            
           
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}

//struct RunDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RunDetailView()
//    }
//}
