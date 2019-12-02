import Foundation
import RealmSwift

class CustomizedInfo: Object {
    @objc dynamic var cardID: String = ""
    @objc dynamic var info_key: String?
    @objc dynamic var info_value: String?
    
    override static func indexedProperties() -> [String] {
        return ["info_key", "info_value"]
    }
    
    init(cardID: String, key: String) {
        self.cardID = cardID
        self.info_key = key
    }
    
    init(cardID: String, key: String, value: String) {
        self.cardID = cardID
        self.info_key = key
        self.info_value = value
    }
    
    required init(){}
    
}
