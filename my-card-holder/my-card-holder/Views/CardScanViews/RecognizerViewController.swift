import UIKit
import PayCardsRecognizer

class RecognizerViewController: UIViewController, PayCardsRecognizerPlatformDelegate {
    
    var recognizer: PayCardsRecognizer!
    var card_number: String = ""
    var card_holder: String = ""
    var expire_month: String = ""
    var expire_year: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        recognizer = PayCardsRecognizer(delegate: self, resultMode: .sync, container: self.view, frameColor: .green)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        recognizer.startCamera()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("view disapper")
        recognizer.stopCamera()
    }
    
    // PayCardsRecognizerPlatformDelegate
    
    func payCardsRecognizer(_ payCardsRecognizer: PayCardsRecognizer, didRecognize result: PayCardsRecognizerResult) {

        card_number = result.recognizedNumber! // Card number
        card_holder = result.recognizedHolderName! // Card holder
        expire_month = result.recognizedExpireDateMonth! // Expire month
        expire_year = result.recognizedExpireDateYear! // Expire year
    }
    
}
