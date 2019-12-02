import UIKit
import PayCardsRecognizer

class RecognizerViewController: UIViewController, PayCardsRecognizerPlatformDelegate {
    
    var recognizer: PayCardsRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recognizer = PayCardsRecognizer(delegate: self, resultMode: .sync, container: self.view, frameColor: .green)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        recognizer.startCamera()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        recognizer.stopCamera()
    }
    
    // PayCardsRecognizerPlatformDelegate
    
    func payCardsRecognizer(_ payCardsRecognizer: PayCardsRecognizer, didRecognize result: PayCardsRecognizerResult) {
        print(result.recognizedNumber) // Card number
        print(result.recognizedHolderName) // Card holder
        print(result.recognizedExpireDateMonth) // Expire month
        print(result.recognizedExpireDateYear) // Expire year
    }
    
}
