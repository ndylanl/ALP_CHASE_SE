//
//  HomeViewModel.swift
//  ALP_CHASE_SE
//
//  Created by MacBook Pro on 05/06/23.
//

import Foundation

class HomeViewModel : ObservableObject{
    @Published var dateFormatterGet = DateFormatter()
    
    init() {
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
}
