import XCTest

import EspyTests

var tests = [XCTestCaseEntry]()
tests += EspyTests.allTests()
XCTMain(tests)