class CheckOption {
  private var arguments: [String]
  private var argType: String
  private var option: String
  private var param: (flag: [Bool], exclude: Bool, length: Int, status: Int)
  init(arguments: [String], argType: String = "unknown", option: String = "",
               param: (flag: [Bool], exclude: Bool, length: Int, status: Int) = ([false, false, false, false], false, 0, 0)) {
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
            param.flag[0] = true
            param.flag[1] = true
            param.flag[2] = true
            param.flag[3] = true
          case "u":
            param.flag[0] = true
          case "l":
            param.flag[1] = true
          case "n":
            param.flag[2] = true
          case "s":
            param.flag[3] = true
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
  func getOption() -> ([Bool], Bool, Int, Int) {
    self.checkArguments()
    return ([param.flag[0], param.flag[1], param.flag[2], param.flag[3]], param.exclude, param.length, param.status)
  }
}
