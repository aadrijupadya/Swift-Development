//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
//creating protocols that check for price update
protocol CoinManagerDelegate {
    func didUpdatePrice(price: String , currency: String)
    func didFailWithError(error: Error)
}
//Coin Manager Sructure
struct CoinManager {
    var delegate: CoinManagerDelegate?
    //setting delegate
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "77A94495-A63F-43F5-B93F-BE9A5615815B"
    //utilizing personal apiKey and baseurl
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    //List of currencies
    
    func getCoinPrice(for currency: String) {
        //function to get coin price
        
        //Use String concatenation to add the selected currency at the end of the baseURL along with the API key.
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        //Use optional binding to unwrap the URL that's created from the urlString
        if let url = URL(string: urlString) {
            
            //Create a new URLSession object with default configuration.
            let session = URLSession(configuration: .default)
            
            //Create a new data task for the URLSession
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                //Format the data we got back as a string to be able to print it.
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                        //calling on delegate to update price
                    }
                }
               
                
            }
            //Start task to fetch data from bitcoin average's servers.
            task.resume()
        }
    }
    //Function to parse data (in json format)
    func parseJSON(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            print(lastPrice)
            return lastPrice
           
        }
        catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
        //throws error exception if it exists
    }
    
    
}
