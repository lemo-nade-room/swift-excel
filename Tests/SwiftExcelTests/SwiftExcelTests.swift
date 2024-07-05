import XCTest
@testable import SwiftExcel

final class SwiftExcelTests: XCTestCase {
    func test() throws {
        XCTAssertEqual(SwiftExcel.add(a: 1, b: 2), 3)
    }
}
