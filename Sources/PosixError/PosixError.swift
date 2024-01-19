import Foundation
@_exported import Trace

public struct PosixError {
  public let errno    : Int32
  public let strerror : String
  
  public init() {
    self.errno    = Darwin.errno
    self.strerror = String( cString: Darwin.strerror(errno))
  }
}

extension Trace {
  public static func posix(file: String = #file, line: Int = #line, function: String = #function, _ source: Any, tag: String = "") -> Trace {
      Trace(file: file, line: line, function: function, source, tag: tag, context: PosixError())
  }
}
