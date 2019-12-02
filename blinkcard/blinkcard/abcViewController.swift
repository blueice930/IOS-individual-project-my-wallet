//
//  abcViewController.swift
//  blinkcard
//
//  Created by Ronnie Li on 12/1/19.
//  Copyright © 2019 Ronnie Li. All rights reserved.
//

import UIKit
import CardScan

class abcViewController: UIViewController, ScanDelegate {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if !ScanViewController.isCompatible() {
            // Hide your "scan card" button because this device isn't compatible with CardScan
        }
    }
    
    
    
    @IBAction func scanCardButtonPressed() {
        guard let vc = ScanViewController.createViewController(withDelegate: self) else {
            print("This device is incompatible with CardScan")
            return
        }
        
        self.present(vc, animated: true)
    }
    
    func userDidSkip(_ scanViewController: ScanViewController) {
        self.dismiss(animated: true)
    }
    
    func userDidCancel(_ scanViewController: ScanViewController) {
        self.dismiss(animated: true)
    }
    
    func userDidScanCard(_ scanViewController: ScanViewController, creditCard: CreditCard) {
        let number = creditCard.number
        let expiryMonth = creditCard.expiryMonth
        let expiryYear = creditCard.expiryYear
        
        
        
    
        // If you're using Stripe and you include the CardScan/Stripe pod, you
        // can get `STPCardParams` directly from CardScan `CreditCard` objects,
        // which you can use with Stripe's APIs
        //        let cardParams = creditCard.cardParams()
        
        // At this point you have the credit card number and optionally the expiry.
        // You can either tokenize the number or prompt the user for more
        // information (e.g., CVV) before tokenizing.
        
        self.dismiss(animated: true)
    }
}
