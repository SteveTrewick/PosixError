import Foundation
@_exported import Trace

#if canImport(Darwin)
import Darwin
#endif

#if canImport(Glibc)
import Glibc
#endif


public struct PosixError {
  public let errno    : Int32
  public let strerror : String
  
  public init() {
    self.errno    = PosixError.posixerrno()
    self.strerror = PosixError.posixstrerror()
  }
  
  
  // well, I was super smart and had to use errno and sterror as properties, which means I had to
  // use Darwin.errno and Darwin.strerror, which of course you can't for a linux compile,
  // which these days I need for GPT Codex, so, well, here we are.
  
  static func posixerrno() -> Int32 {
    #if canImport(Glibc)
    return Glibc.errno
    #else
    return Darwin.errno
    #endif
  }
  
  static func posixstrerror() -> String {
    #if canImport(Glibc)
    return String(cString: Glibc.strerror(Glibc.errno))
    #else
    return String(cString: Darwin.strerror(Darwin.errno))
    #endif
  }
}

extension Trace {
  public static func posix(file: String = #file, line: Int = #line, function: String = #function, _ source: Any, tag: String = "") -> Trace {
      Trace(file: file, line: line, function: function, source, tag: tag, context: PosixError())
  }
  
  
  
}
