//
//  NewRunView.swift
//  ALP_CHASE_SE
//
//  Created by MacBook Pro on 25/05/23.
//

import SwiftUI
import UIKit
import MapKit

struct NewRunView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var controller = NewRunViewController()
    let maxHeight = UIScreen.main.bounds.size.height
    let maxWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        NavigationStack {
            VStack {
                MapView(controller: controller).frame( width: maxWidth,height: controller.isRunning ? maxHeight / 2 : ((maxHeight * 7)/8)).padding(0)
                if controller.distanceLabel != "" {
                    VStack{
                        HStack{
                            Text("Distance").fontWeight(.bold)
                            Spacer()
                            Text(controller.distanceLabel)
                        }
                        
                        HStack{
                            Text("Time").fontWeight(.bold)
                            Spacer()
                            Text(controller.timeLabel)
                        }
                        
                        HStack{
                            Text("Pace").fontWeight(.bold)
                            Spacer()
                            Text(controller.paceLabel)
                        }
                    }.padding(20)
                    Spacer()
                }
                
                
//                Map(coordinateRegion: $controller.region
//                    ,showsUserLocation: true)
//                .frame(height: 300)
                
                if controller.isRunning {
                    Button(action: {
                        controller.showAlert = true
                    }) {
                        VStack{
                            HStack{
                                Spacer()
                                Text("Stop").font(.system(size:25))
                                Spacer()
                            }
                            Spacer()
                        }.padding([.top], 20)
                    }.background(.blue).foregroundColor(.white).frame(height: maxHeight/8)
                    .alert("Do You Want to Save the Run?", isPresented: $controller.showAlert) {
                        Button("Save") {
                            controller.stopTapped(isSave: true)
                        }
                        Button("Discard")  {
                            controller.stopTapped(isSave: false)
                           
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                dismiss()
                            }
                        }
                    }
                } else {
                    Button(action: {
                        controller.startTapped()
                    }) {
                        VStack{
                            
                            HStack{
                                Spacer()
                                Text("Start").font(.system(size:25))
                                Spacer()
                            }
                            Spacer()
                        }.padding([.top], 20)
                    }.background(.blue).foregroundColor(.white).frame(height: maxHeight/8).padding(0)
                }
            }
        }.ignoresSafeArea(.all).background(controller.isRunning ? .white : .blue)
    }
}

struct NewRunView_Previews: PreviewProvider {
    static var previews: some View {
        NewRunView()
    }
}
