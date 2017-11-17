//
//  HotelLIstModelView.swift
//  MyHotelRoomMVVM
//
//  Created by sebastian on 16/11/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import UIKit

class HotelsViewModel : NSObject {
    
    @IBOutlet var hotelsApiCall : HotelsApiCall!
    
    var hotelList : [NSDictionary]?
    
    /*
     Function to get hotel list from Hotels Api Call class.
     */
    func getHotels(completion: @escaping () -> Void){
        
        hotelsApiCall.fetchHotelList { (hotels, error) in
            
            if error == nil {
                
                DispatchQueue.main.async {
                    self.hotelList = hotels
                }
            }
        }
    }
    
    
    /**
     Number of items to show in our tableView.
     */
    func numberOfItemsToShow (in section: Int) -> Int {
        return self.hotelList?.count ?? 0
    }
    /**
     Function to get the app's name.
     */
    func hotelNameToDisplay(for indexPath: IndexPath) -> String {
        return self.hotelList?[indexPath.row].value(forKeyPath: "name") as? String ?? ""
    }
    
    func hotelPropertyTypeToDisplay(for indexPath: IndexPath) -> String {
        let propertyType = self.hotelList?[indexPath.row].value(forKeyPath: "property_type") as? String ?? ""
        return propertyType
    }
    
    /**
     Function to get hotel price per night.
     */
    func hotelCostToDisplay(for indexPath: IndexPath) -> String{
        let pricing = self.hotelList?[indexPath.row].value(forKeyPath: "pricing_quote.localized_nightly_price") as? String ?? ""
        
        return pricing
    }
    
    /**
     Function to get hotel currency.
     */
    func hotelCurrencyPriceToDisplay(for indexPath: IndexPath) -> String {
        let currency = self.hotelList?[indexPath.row].value(forKeyPath: "pricing_quote.localized_currency") as? String ?? ""
        return currency
    }
    
    /**
     Function to convert the imageUrl to UIImage.
     */
    func appImageToDisplay (for indexPath: IndexPath) -> URL {
        let stringImage = hotelList?[indexPath.row].value(forKeyPath: "picture_url") as? String ?? ""
        
        let urlImage : URL = URL(string: stringImage)!
        

        return urlImage
    }
    
}
