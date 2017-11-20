//
//  HotelsApiCall.swift
//  MyHotelRoomMVVM
//
//  Created by sebastian on 15/11/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import Foundation
import Alamofire

class HotelsApiCall : NSObject {
    
    let hotelListApiEndPoint : String = "https://api.airbnb.com/v2/search_results?client_id=3092nxybyb0otqw18e8nh5nty"
    
    /*
     Function to get a list of hotels from airBnb API.
     */
    func fetchHotelList(completion: @escaping ([NSDictionary]?, NSError? ) -> Void){
        
        
        guard let url = URL(string: self.hotelListApiEndPoint) else { print("Error unwrapping URL"); return}

        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
            
            switch response.result {
                
            case .success:
                
                do {
                    if let responseJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments)  as? NSDictionary {
                        
                        if let hotels = responseJSON.value(forKeyPath: "search_results") as? [NSDictionary] {
                           
        
                            
                            completion(hotels, nil)
                        }
                        
                    }
                }
                catch {
                    completion(nil, error as NSError?)
                }
                
            case .failure(let error):
                
                completion(nil, error as NSError?)
                
            }
            
            
        }
    }
}
