class Screen {
  func write(message:String) {
    print(message)
  }
}
import Cocoa    // Pasteboard device is required.
class Pasteboard {
  private let board: NSPasteboard
  private let item: NSPasteboardItem
  private var content: String!
  init(board: NSPasteboard = NSPasteboard.general(), item: NSPasteboardItem = NSPasteboardItem(),
        content: String! = nil) {
    self.board = board
    self.item = item
    self.content = content
  }
  func write(message:String) {
    board.clearContents()
    item.setString(message, forType: NSPasteboardTypeString)
    board.writeObjects([item])
  }
  func read() -> String {
    content = board.string(forType: NSPasteboardTypeString)
    if content == nil {
      content = ""
    }
    return content
  }
}
