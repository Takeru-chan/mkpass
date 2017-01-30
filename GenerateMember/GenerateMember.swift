class GenerateMember {
  private var range: [[Int]]    // 対象文字種のASCII code開始番号と終了番号組み合わせ配列の配列で指定
  private var exclude: [Int]    // 配列から除外する文字の要素番号を降順で指定
  private var member: [String]  // 生成された対象文字の配列
  init(range: [[Int]] = [[]], exclude: [Int] = [], member: [String] = []) {
    self.range = range
    self.exclude = exclude
    self.member = member
  }
  func getMember(range: [[Int]], exclude: [Int]) -> ([String]) {
    for loop in range {
      for code in loop[0]...loop[1] {
        member.append("\(UnicodeScalar(code)!)")
      }
    }
    if exclude.count != 0 {
      for code in exclude {
        member.remove(at:code)
      }
    }
    return (member)
  }
}
