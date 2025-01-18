//
//  RepositoriesCoordinatorTests.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 18/01/25.
//

import XCTest
@testable import GitSwiftList
final class RepositoriesCoordinatorTests: XCTestCase {
    
    var coordinator: RepositoriesCoordinator!
    var navigationControllerMock: NavigationControllerMock!
    
    override func setUp() {
        super.setUp()
        navigationControllerMock = NavigationControllerMock()
        coordinator = RepositoriesCoordinator(navigationController: navigationControllerMock)
    }
    
    override func tearDown() {
        coordinator = nil
        navigationControllerMock = nil
        super.tearDown()
    }
    
    func testStart_ShouldPushRepositoriesViewController() {
        coordinator.start()
        
        XCTAssertTrue(navigationControllerMock.pushedViewController is RepositoriesViewController)
        let viewController = navigationControllerMock.pushedViewController as? RepositoriesViewController
        XCTAssertNotNil(viewController)
        XCTAssertNotNil(viewController?.coordinator)
    }
    
    func testDidFinish_ShouldPushPullRequestsCoordinator() {
        let mock = Repository(id: 1, name: "Repository1", owner: Owner(login: "Owner1", avatarUrl: ""), description: "", url: "", starsCount: 1, forksCount: 1)
        
        coordinator.didFinish(repository: mock)
        
        XCTAssertTrue(navigationControllerMock.pushedViewController is PullRequestsViewController)
        let viewController = navigationControllerMock.pushedViewController as? PullRequestsViewController
        XCTAssertNotNil(viewController)
        XCTAssertEqual(viewController?.viewModel.repository.name, "Repository1")
    }
}
