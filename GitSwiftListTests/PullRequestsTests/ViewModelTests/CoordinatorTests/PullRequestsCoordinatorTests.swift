//
//  PullRequestsCoordinatorTests.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 18/01/25.
//

import XCTest
@testable import GitSwiftList


final class PullRequestsCoordinatorTests: XCTestCase {
    
    var coordinator: PullRequestsCoordinator!
    var navigationControllerMock: NavigationControllerMock!
    
    override func setUp() {
        super.setUp()
        navigationControllerMock = NavigationControllerMock()
        coordinator = PullRequestsCoordinator(navigationController: navigationControllerMock)
    }
    
    override func tearDown() {
        coordinator = nil
        navigationControllerMock = nil
        super.tearDown()
    }
    
    func testStart_ShouldPushPullRequestsViewController() {
        let mock = Repository(id: 1, name: "Repository1", owner: Owner(login: "Owner1", avatarUrl: ""), description: "", url: "", starsCount: 1, forksCount: 1)
        
        coordinator.repository = mock
        
        coordinator.start()
        
        XCTAssertTrue(navigationControllerMock.pushedViewController is PullRequestsViewController)
        let viewController = navigationControllerMock.pushedViewController as? PullRequestsViewController
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.viewModel.repository.name, "Repository1")
        XCTAssertNotNil(viewController?.coordinator)
    }
    
    func testStart_WhenRepositoryIsNil_ShouldNotPushViewController() {
        coordinator.repository = nil
        coordinator.start()
        
        XCTAssertNil(navigationControllerMock.pushedViewController)
    }
    
    func testDidFinish_ShouldPushPullRequestDetailWebView() {
        let mockURL = "https://github.com/testDidFinish"
        
        coordinator.didFinish(url: mockURL)
        
        XCTAssertTrue(navigationControllerMock.pushedViewController is PullRequestDetailWebView)
        let webView = navigationControllerMock.pushedViewController as? PullRequestDetailWebView
        XCTAssertNotNil(webView)
        XCTAssertEqual(webView?.url, mockURL)
    }
}
