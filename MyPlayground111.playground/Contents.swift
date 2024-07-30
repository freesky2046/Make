import UIKit

var num = 99999999
let num2: CGFloat  = CGFloat(num) / 10000.0
let rounded_up2: CGFloat = floor(num2 * 10) / 10;
let result = String(format: "%.1f万", rounded_up2)
print(result)

