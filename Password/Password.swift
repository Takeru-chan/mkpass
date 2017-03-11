// Password version 1.00, 2017.2.17, (c)2017 Takeru-chan
// Released under the MIT license. http://opensource.org/licenses/MIT
// Usage:
// let password:Password = Password()
// let member:[Character] = ["1","2","3","4","5"]
// let length:Int = 10
// let generatedPassword:String = password.get(member:member, length:length)
//
import Foundation
class Password {
  private var password: String      // get method returns password string from character data set.
  private var obfuscate: String     // complex method returns obfuscate string from password.
  private var returnCode: Int32
  init(password: String = "", obfuscate: String = "", returnCode: Int32 = 0) {
    self.password = password
    self.obfuscate = obfuscate
    self.returnCode = returnCode
  }
  func get(member:[Character], length:Int) -> (String) {
    var code: UInt32
    #if os(Linux)
    srandom(UInt32(time(nil)))
    #endif
    for _ in 1...length {
      #if os(Linux)
      code = UInt32(random() % member.count)
      #else
      code = arc4random_uniform(UInt32(member.count))
      #endif
      password += "\(member[Int(code)])"
    }
    return password
  }
  func complex() -> (String, Int32) {
    return (obfuscate, returnCode)
  }
  func restore() -> (String, Int32) {
    return (password, returnCode)
  }
}
