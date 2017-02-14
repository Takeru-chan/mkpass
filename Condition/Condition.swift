class Condition {
  private let arguments: [String]
  private var length: Int
  private var returnCode: Int32
  private var member: String
  private let upper: [String]
  private let lower: [String]
  private let number: [String]
  private let symbol: [String]
  private var argType: String
  private var option: String
  private var status: (upper: Int, lower: Int, number: Int, symbol: Int, exclude: Int)
  init(arguments: [String] = CommandLine.arguments, argType: String = "unknown", option: String = "",
               length: Int = 0, returnCode: Int32 = 0, member: String = "",
               upper: [String] = ["ABCDEFGHIJKLMNOPQRSTUVWXYZ","ABCDEFGHJKLMNPQRSTUVWXYZ"],
               lower: [String] = ["abcdefghijklmnopqrstuvwxyz","abcdefghijkmnopqrstuvwxyz"],
               number: [String] = ["0123456789","23456789"],
               symbol: [String] = ["!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~","!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{}~"],
               status: (upper: Int, lower: Int, number: Int, symbol: Int, exclude: Int) = (0, 0, 0, 0, 0)) {
    self.arguments = arguments
    self.length = length
    self.returnCode = returnCode
    self.member = member
    self.upper = upper
    self.lower = lower
    self.number = number
    self.symbol = symbol
    self.argType = argType
    self.option = option
    self.status = status
  }
  func generateMember() {
    chk_opt: for n in 1..<arguments.count {
      option = arguments[n]
      for char in option.characters {
        if argType == "unknown" {
          switch char {
          case "-":
            argType = "optSW"
          case "1"..."9":
            argType = "length"
          default:
            argType = "error"
            returnCode = 1
            break
          }
        } else if argType == "optSW" {
          switch char {
          case "a":
            status.upper |= 0b00000001
            status.lower |= 0b00000001
            status.number |= 0b00000001
            status.symbol |= 0b00000001
          case "u":
            status.upper |= 0b00000001
          case "l":
            status.lower |= 0b00000001
          case "n":
            status.number |= 0b00000001
          case "s":
            status.symbol |= 0b00000001
          case "x":
            status.exclude |=  0b00000001
          default:
            argType = "error"
            returnCode = 1
            break
          }
        } else if argType == "length" {
          switch char {
          case "0"..."9":
            argType = "length"
          default:
            argType = "error"
            returnCode = 1
            break
          }
        }
        if returnCode != 0 {
          break chk_opt
        }
      }
      switch argType {
      case "length":
        length = Int(option)!
      default:
        break
      }
      argType = "unknown"
    }
    if status.upper != 0 {
      member += upper[status.exclude]
    }
    if status.lower != 0 {
      member += lower[status.exclude]
    }
    if status.number != 0 {
      member += number[status.exclude]
    }
    if status.symbol != 0 {
      member += symbol[status.exclude]
    }
    if (returnCode == 0 && member == "") {
      member += lower[status.exclude]
      member += number[status.exclude]
    }
    if (returnCode == 0 && length == 0) {
      length = 8
    }
  }
  func get() -> ([Character], Int, Int32) {
    self.generateMember()
    let chars: [Character] = Array(member.characters)
    return (chars, length, returnCode)
  }
}
