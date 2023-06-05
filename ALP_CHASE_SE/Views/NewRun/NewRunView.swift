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
    @StateObject private var viewModel = NewRunViewModel()
    let maxHeight = UIScreen.main.bounds.size.height
    let maxWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        NavigationStack {
            VStack {
                MapView(viewModel: viewModel).frame( width: maxWidth,height: viewModel.isRunning ? maxHeight / 2 : ((maxHeight * 7)/8)).padding(0)
                if viewModel.distanceLabel != "" {
                    VStack{
                        HStack{
                            Text("Distance").fontWeight(.bold)
                            Spacer()
                            Text(viewModel.distanceLabel)
                        }
                        
                        HStack{
                            Text("Time").fontWeight(.bold)
                            Spacer()
                            Text(viewModel.timeLabel)
                        }
                        
                        HStack{
                            Text("Pace").fontWeight(.bold)
                            Spacer()
                            Text(viewModel.paceLabel)
                        }
                    }.padding(20)
                    Spacer()
                }
                
                
//                Map(coordinateRegion: $viewModel.region
//                    ,showsUserLocation: true)
//                .frame(height: 300)
                
                if viewModel.isRunning {
                    Button(action: {
                        viewModel.showAlert = true
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
                    .alert("Do You Want to Save the Run?", isPresented: $viewModel.showAlert) {
                        Button("Save") {
                            viewModel.stopTapped(isSave: true)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                dismiss()
                            }
                        }
                        Button("Discard")  {
                            viewModel.stopTapped(isSave: false)
                           
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                dismiss()
                            }
                        }
                    }
                } else {
                    Button(action: {
                        viewModel.startTapped()
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
        }.ignoresSafeArea(.all).background(viewModel.isRunning ? .white : .blue)
    }
}

struct NewRunView_Previews: PreviewProvider {
    static var previews: some View {
        NewRunView()
    }
}
