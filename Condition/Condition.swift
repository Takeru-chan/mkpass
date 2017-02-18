class Condition {
  private var length: Int           // Condition class returns length of password from options.
  private var returnCode: Int32     // Condition class returns return code. Success:0, Version:1, Help:2, Failure:9
  private var member: [Character]   // Condition class returns character set of password from options.
  init(length: Int = 0, returnCode: Int32 = 0, member: [Character] = []) {
    self.length = length
    self.returnCode = returnCode
    self.member = member
  }
  func get(arguments: [String]) -> ([Character], Int, Int32) {
    enum ArgsType {
      case unknown
      case option
      case length
      case error
    }
    var argType: ArgsType = ArgsType.unknown
    var option: String
    let upper: [String] = ["ABCDEFGHIJKLMNOPQRSTUVWXYZ","ABCDEFGHJKLMNPQRSTUVWXYZ"]
    let lower: [String] = ["abcdefghijklmnopqrstuvwxyz","abcdefghijkmnopqrstuvwxyz"]
    let number: [String] = ["0123456789","23456789"]
    let symbol: [String] = ["!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~","!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{}~"]
    var status: (upper: Int, lower: Int, number: Int, symbol: Int, exclude: Int) = (0, 0, 0, 0, 0)
    chk_opt: for n in 1..<arguments.count {
      option = arguments[n]
      for char in option.characters {
        if argType == ArgsType.unknown {
          switch char {
          case "-":
            argType = ArgsType.option
          case "1"..."9":
            argType = ArgsType.length
          default:
            argType = ArgsType.error
            returnCode = 9
            break
          }
        } else if argType == ArgsType.option {
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
          case "v":
            argType = ArgsType.error
            returnCode = 1
            break
          case "h":
            argType = ArgsType.error
            returnCode = 2
            break
          default:
            argType = ArgsType.error
            returnCode = 9
            break
          }
        } else if argType == ArgsType.length {
          switch char {
          case "0"..."9":
            argType = ArgsType.length
          default:
            argType = ArgsType.error
            returnCode = 9
            break
          }
        }
        if returnCode != 0 {
          break chk_opt
        }
      }
      if argType == ArgsType.length {
        length = Int(option)!
      }
      argType = ArgsType.unknown
    }
    if status.upper != 0 {
      member += Array(upper[status.exclude].characters)
    }
    if status.lower != 0 {
      member += Array(lower[status.exclude].characters)
    }
    if status.number != 0 {
      member += Array(number[status.exclude].characters)
    }
    if status.symbol != 0 {
      member += Array(symbol[status.exclude].characters)
    }
    if (returnCode == 0 && member.count == 0) {
      member = Array(lower[status.exclude].characters) + Array(number[status.exclude].characters)
    }
    if (returnCode == 0 && length == 0) {
      length = 8
    }
    return (member, length, returnCode)
  }
}
