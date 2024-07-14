import XCTest
@testable import SwiftExcel

final class SwiftExcelTests: XCTestCase {
    func test() throws {
        XCTAssertEqual(SwiftExcel.add(lhs: 1, rhs: 2), 3)
    }
}
