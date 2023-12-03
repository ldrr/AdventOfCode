import Foundation

public func measureExecutionTime(closure: () -> Void) -> TimeInterval {
    let startTime = DispatchTime.now()
    closure()
    let endTime = DispatchTime.now()

    let nanoTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
    let executionTime = TimeInterval(nanoTime) / 1_000_000_000

    return executionTime
}

public func contentOfResource(name: String, type: String) -> String {
    let filePath = Bundle.main.path(forResource:name, ofType: type)!
    let contentData = FileManager.default.contents(atPath: filePath)!
    let content = String(data:contentData, encoding:String.Encoding.utf8)
    return content!
}
