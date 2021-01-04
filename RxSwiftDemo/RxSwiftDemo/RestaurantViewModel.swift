//
//  RestaurantViewModel.swift
//  RxSwiftDemo
//
//  Created by Zepiao Han on 1/1/21.
//

import Foundation

struct RestaurantViewModel {
    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine 
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
}
