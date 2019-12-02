import SwiftUI
import UIKit

struct CardScanIntegratedViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CardScanIntegratedViewController>) -> RecognizerViewController {
        
        return RecognizerViewController()
    }
    
    func updateUIViewController(_ uiViewController: RecognizerViewController, context: UIViewControllerRepresentableContext<CardScanIntegratedViewController>) {
        
    }
    
}
