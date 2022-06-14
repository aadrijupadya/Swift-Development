//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //setting the coin manager delegate
    var coinManager = CoinManager()
    //outlet connections
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        coinManager.delegate = self //setting the delegate
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        // Do any additional setup after loading the view.
    }
}
//using extensions to organize code
//MARK: - UIPickerView Delegate and DataSource
    extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
            
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return coinManager.currencyArray.count
            //returns index of currency
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return coinManager.currencyArray[row]
            //returns name of currency

        }
        
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let currency_string = coinManager.currencyArray[row]
            coinManager.getCoinPrice(for: currency_string)
            //uses api call to get bitcoin price
            
        }
        
    }
//MARK: - CoinManagerDelegate

    extension ViewController: CoinManagerDelegate {
        func didUpdatePrice(price: String, currency: String) {
            DispatchQueue.main.async {
                       self.bitcoinLabel.text = price
                       self.currencyLabel.text = currency
                   }
        }
        //Function to call price from API and change the labels
        
        func didFailWithError(error: Error) {
            print(error)
        }
        //Checks for error
        
    }
    
   
    



