import UIKit




class ImageInfo : Codable {
    var w: CGFloat = 0.0
    var h: CGFloat = 0.0
    var fileName: String = "123"
    
    func encodeToDictionary() -> [String: Any]? {
        
       guard let data = try? encodeToData() else {
           return nil
       }
       
       return try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: Any]
   }
    
    
    func encodeToDict() -> [String: Any]? {
        
       guard let data = try? encodeToData() else {
           return nil
       }
      let decoder = JSONDecoder()
     let  dict = try? decoder.decode([String: Any], from: data)
      return dict
   }
    
    public func encodeToData() throws -> Data {
        let ecd = JSONEncoder()
        ecd.outputFormatting = .prettyPrinted
        return try ecd.encode(self)
    }
}


let info = ImageInfo()
let result = info.encodeToDictionary()
let result2 = info.encodeToDict()


