//
//  HomeView.swift
//  ALP_CHASE_SE
//
//  Created by MacBook Pro on 27/05/23.
//

import SwiftUI


struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var controller = HomeViewController()
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Run.distance, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Run>
    
    let maxHeight = UIScreen.main.bounds.size.height
    let maxWidth = UIScreen.main.bounds.size.width
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(items) { item in
                    
                    NavigationLink {
                        RunDetailView(run: item)
                    } label: {
                        RunCardComponent(date:item.timestamp!, distance: item.distance as NSNumber)
                    }
                }
            }
            
            NavigationLink {
                NewRunView()
            } label: {
                
                Text("Start New Run").frame(width: maxWidth, height: maxHeight / 10, alignment: .center)
                    .background(.blue)
                    .foregroundColor(.white)
            }.toolbarBackground(.visible, for: .navigationBar)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

