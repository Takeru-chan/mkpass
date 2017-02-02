class CheckOption {
  private var arguments: [String]
  private var argType: String
  private var option: String
  private var param: (upper: Bool, lower: Bool, number: Bool, symbol: Bool, exclude: Bool, length: Int, status: Int)
  init(arguments: [String], argType: String = "unknown", option: String = "",
               param: (upper: Bool, lower: Bool, number: Bool, symbol: Bool, exclude: Bool, length: Int, status: Int) = (false, false, false, false, false, 0, 0)) {
    self.arguments = arguments
    self.argType = argType
    self.option = option
    self.param = param
  }
  func checkArguments() {
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
            param.status = 1
            break
          }
        } else if argType == "optSW" {
          switch char {
          case "a":
            param.upper = true
            param.lower = true
            param.number = true
            param.symbol = true
          case "u":
            param.upper = true
          case "l":
            param.lower = true
          case "n":
            param.number = true
          case "s":
            param.symbol = true
          case "x":
            param.exclude = true
          default:
            argType = "error"
            param.status = 1
            break
          }
        } else if argType == "length" {
          switch char {
          case "0"..."9":
            argType = "length"
          default:
            argType = "error"
            param.status = 1
            break
          }
        }
        if param.status != 0 {
          break chk_opt
        }
      }
      switch argType {
      case "length":
        param.length = Int(option)!
      default:
        break
      }
      argType = "unknown"
    }
  }
  func getOption() -> (Bool, Bool, Bool, Bool, Bool, Int, Int) {
    self.checkArguments()
    return (param.upper, param.lower, param.number, param.symbol, param.exclude, param.length, param.status)
  }
}
