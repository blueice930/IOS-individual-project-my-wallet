import Foundation
import RealmSwift

class Card: Object {
    @objc dynamic var cardID = UUID().uuidString
    @objc dynamic var card_type: String?
    @objc dynamic var card_front_img: String?
    @objc dynamic var card_back_img: String?
    
    let other_info = List<CustomizedInfo>()
    
    required init() {
        let cardNum = CustomizedInfo(cardID: self.cardID, key: "card_number")
        self.other_info.append(cardNum)
    }
    
    init(type: String) {
        card_type = type
        let cardNum = CustomizedInfo(cardID: self.cardID, key: "card_number")
        self.other_info.append(cardNum)
    }
    
    override static func primaryKey() -> String? {
        return "cardID"
    }
    
    override static func indexedProperties() -> [String] {
        return ["card_type"]
    }
    
    func addInfo(name key: String, value: String) {
        var hasSameKey = false
        for info in self.other_info {
            if info.info_key == key {
                hasSameKey = true
                try! db.write {
                    info.info_value = value
                }
            }
        }
        if !hasSameKey {
            let info = CustomizedInfo(cardID: self.cardID, key: key, value: value)
            try! db.write {
                self.other_info.append(info)
            }
        }
    }
    
    func removeInfo(key: String) {
        for (index, info) in self.other_info.enumerated() {
            if info.info_key == key {
                try! db.write {
                    self.other_info.remove(at: index)
                    db.delete(info)
                }
            }
        }
    }
    
    func destroy() {
        let id = self.cardID
        let infoArr = db.objects(CustomizedInfo.self).filter("cardID = %@", id)
        try! db.write {
            db.delete(self)
            db.delete(infoArr)
        }
        
        
    }
}
