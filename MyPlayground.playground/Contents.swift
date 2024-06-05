import UIKit

var greeting = "Hello, playground"


class PersonalMuseumItem: Codable {
    var exhId: String?    // 展览 id
    var exhImg: String?  // 展览图片
    var exhName: String? // 展览名称
    var exhSort: Int? // 展览位置
    var jumpUrl: String? // 跳转链接
    
    var isEmpty: Bool  {
        if let exhId = self.exhId {
           return exhId.isEmpty || exhId == "0"
        }
        else {
            return true
        }
    }
}

var item1 = PersonalMuseumItem()
item1.exhId = "1"

var item2 = PersonalMuseumItem()
item2.exhId = "2"

var list = [item1, item2]
var item3 = list[0]
item3.exhId = "3"

print(item1.exhId)


