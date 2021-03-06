import XCTest

extension XCTestCase {
    func waitForElementToAppear(element: XCUIElement, timeout: NSTimeInterval = 10,  file: String = __FILE__, line: UInt = __LINE__) {
        let existsPredicate = NSPredicate(format: "exists == true")
        
        expectationForPredicate(existsPredicate,
            evaluatedWithObject: element, handler: nil)
        
        waitForExpectationsWithTimeout(timeout) { (error) -> Void in
            if (error != nil) {
                let message = "Failed to find \(element) after \(timeout) seconds."
                self.recordFailureWithDescription(message, inFile: file, atLine: line, expected: true)
            }
        }
    }
}

extension XCUIElement {
    func forceTapElement() {
        if self.hittable {
            self.tap()
        } else {
            let coordinate: XCUICoordinate = self.coordinateWithNormalizedOffset(CGVectorMake(0.0, 0.0))
            coordinate.tap()
        }
    }
}