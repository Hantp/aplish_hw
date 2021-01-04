//
//  RestaurantListViewModel.swift
//  RxSwiftDemo
//
//  Created by Zepiao Han on 12/31/20.
//

import Foundation
import RxSwift

final class RestaurantListViewModel {
    let title = "Restaurants"
    
    private let restaurantService: RestaurantServiceProtocol
    
    init(restaurant: RestaurantServiceProtocol = RestaurantService()) {
        restaurantService = restaurant
    }
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurants().map {
            $0.map {
                RestaurantViewModel(restaurant: $0)
            }
        }
    }
}

