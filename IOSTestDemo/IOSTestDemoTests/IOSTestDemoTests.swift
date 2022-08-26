//
//  IOSTestDemoTests.swift
//  IOSTestDemoTests
//
//  Created by Vraj Shah on 26/08/22.
//

import XCTest
@testable import IOSTestDemo

class IOSTestDemoTests: XCTestCase {

    //Mark :- Variables
    var userViewModel: UserViewModel!
    
    override func setUpWithError() throws {
        userViewModel = UserViewModel()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        userViewModel = nil
    }
    
    func test_entered_name_is_empty() throws {
        XCTAssertFalse(
            userViewModel.validateSignupCredentials(
                signupModel: SignupModel(name: "", email: "dummy@gmail.com", password: "dummy")
            ),
            "Name empty"
        )
    }
    
    func test_entered_email_is_empty() throws {
        XCTAssertFalse(
            userViewModel.validateSignupCredentials(
                signupModel: SignupModel(name: "dummy", email: "", password: "dummy")
            ),
            "Email empty"
        )
    }
    
    func test_entered_password_is_empty() throws {
        XCTAssertFalse(
            userViewModel.validateSignupCredentials(
                signupModel: SignupModel(name: "dummy", email: "dummy@gmail.com", password: "")),
            "Password empty"
        )
    }
    
    func test_entered_email_is_not_valid() throws {
        XCTAssertFalse(
            userViewModel.validateSignupCredentials(
                signupModel: SignupModel(name: "dummy", email: "dummy@", password: "dummy")),
            "Email not valid"
        )
    }
    
    func test_entered_proper_credentials() throws {
        XCTAssertTrue(
            userViewModel.validateSignupCredentials(
                signupModel: SignupModel(name: "dummy", email: "dummy@gmail.com", password: "dummy")),
            "Credentials are proper"
        )
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
