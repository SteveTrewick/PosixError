# PosixError

Extends [Trace](https://github.com/SteveTrewick/Trace/tree/main) to provide a posix error number and message
in the context.

The context object captures the current POSIX error and description


## Usage

```swift

class POSIXThing {
  func somePOSIXshizzle() -> Result<T, Trace> {
    // ...
    return .posix(self, tag: "oh no, some posixy thing went horribly wrong!")
  }
}

```
Or simmilar, your Trace error now contains ...
```swift

  Trace ( tag     : "oh no, some posixy thing went horribly wrong!", 
          source  : "POSIXThing", 
          line    : 11, 
          file    : "/path/to/your/file.swift", 
          function: "somePOSIXshizzle", 
          context : Optional(fallthrough.PosixError(errno: 1, strerror: "Operation not permitted"))
  )
  
```


