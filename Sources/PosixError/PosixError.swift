import Foundation
@_exported import Trace

#if canImport(Glibc)
import Glibc
#endif


public struct PosixError {
  public let errno    : Int32
  public let strerror : String
  
  public init() {
    self.errno    = PosixError.posixerrno()
    self.strerror = String( cString: Darwin.strerror(errno))
  }
  
  static func posixerrno() -> Int32 {
    #if canImport(Glibc)
    return Glibc.errno
    #else
    return Darwin.errno
    #endif
  }
}

extension Trace {
  public static func posix(file: String = #file, line: Int = #line, function: String = #function, _ source: Any, tag: String = "") -> Trace {
      Trace(file: file, line: line, function: function, source, tag: tag, context: PosixError())
  }
  
  
  
}
