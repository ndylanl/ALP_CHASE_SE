//
//  HomeViewController.swift
//  ALP_CHASE_SE
//
//  Created by MacBook Pro on 27/05/23.
//

import SwiftUI

final class HomeViewController: ObservableObject {
    
    @Published var dateFormatterGet = DateFormatter()
    
    init() {
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
}
