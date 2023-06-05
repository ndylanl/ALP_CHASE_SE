import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    
    @ObservedObject var viewModel: NewRunViewModel
    
    func makeUIView(context: Context) -> MKMapView {
        viewModel.map.delegate = viewModel
        return viewModel.map
    }
        
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //
    }
    
}
