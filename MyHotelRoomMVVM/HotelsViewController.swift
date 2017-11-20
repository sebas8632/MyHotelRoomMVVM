//
//  ViewController.swift
//  MyHotelRoomMVVM
//
//  Created by sebastian on 15/11/17.
//  Copyright © 2017 Juan Sebastián Florez Saavedra. All rights reserved.
//

import UIKit

class HotelsViewController: UIViewController {

    @IBOutlet var hotelsTableView: UITableView!

    @IBOutlet var hotelsViewModel : HotelsViewModel!
    
    
    var hotels: [NSDictionary]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        hotelsViewModel.getHotels {
            self.hotelsTableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension HotelsViewController : UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelsViewModel.numberOfItemsToShow(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = hotelsTableView.dequeueReusableCell(withIdentifier: "HotelCell", for: indexPath) as! HotelCell
        
        
        cell.hotelName.text = self.hotelsViewModel.hotelNameToDisplay(for: indexPath)
        cell.hotelKind.text = self.hotelsViewModel.hotelPropertyTypeToDisplay(for: indexPath)
        cell.hotelPrice.text = self.hotelsViewModel.hotelCostToDisplay(for: indexPath)
       // cell.hotelIMage.image = #imageLiteral(resourceName: "imagePlaceHolder")
        cell.hotelIMage.image = UIImage(named: "imagePlaceHolder")
                let session = URLSession(configuration: .default)
        
                // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
                let downloadPicTask = session.dataTask(with: self.hotelsViewModel.hotelImageUrlToDisplay(for: indexPath)) { (data, response, error) in
                    // The download has finished.
                    if let e = error {
                        print("Error downloading cat picture: \(e)")
                    } else {
                        // No errors found.
                        // It would be weird if we didn't have a response, so check for that too.
                        if let res = response as? HTTPURLResponse {
                            print("Downloaded cat picture with response code \(res.statusCode)")
                            if let imageData = data {
                                // Finally convert that Data into an image and do what you wish with it.
                                let image = UIImage(data: imageData)
                                // Do something with your image.
                                
                                DispatchQueue.main.async {
                                    
                                
                                cell.hotelIMage.image = image
                                }

                                
                            } else {
                                print("Couldn't get image: Image is nil")
                            }
                        } else {
                            print("Couldn't get response code for some reason")
                        }
                    }
                }
        
                downloadPicTask.resume()
     
        
        
       // cell.hotelIMage.image = self.hotelsViewModel.hotelImageToDisplay(for: indexPath)
        
        return cell
    }
}
