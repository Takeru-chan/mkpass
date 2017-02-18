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
    for _ in 1...length {
      code = arc4random_uniform(UInt32(member.count))
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
