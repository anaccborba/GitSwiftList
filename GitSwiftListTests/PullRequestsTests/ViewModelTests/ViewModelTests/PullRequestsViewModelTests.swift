//
//  PullRequestsViewModelTests.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 18/01/25.
//

import XCTest
@testable import GitSwiftList

class PullRequestsViewModelTests: XCTestCase {
    
    var viewModel: PullRequestsViewModel!
    var serviceMock: PullRequestsServiceMock!
    var repositoryMock: Repository!
    
    override func setUp() {
        super.setUp()
        
        serviceMock = PullRequestsServiceMock()
        repositoryMock = Repository(id: 1, name: "Repository1", owner: Owner(login: "Owner1", avatarUrl: ""), description: "", url: "", starsCount: 1, forksCount: 1)
        
        viewModel = PullRequestsViewModel(repository: repositoryMock, service: serviceMock)
    }
    
    override func tearDown() {
        viewModel = nil
        serviceMock = nil
        repositoryMock = nil
        super.tearDown()
    }
    
    func testFetchPullRequests_ShouldShowLoadingView() {
        let expectation = XCTestExpectation(description: "showLoadingView was called")
        
        viewModel.showLoadingView = {
            expectation.fulfill()
        }
        
        viewModel.fetchPullRequests()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchPullRequests_ShouldHideLoadingView() {
        let expectation = XCTestExpectation(description: "hideLoadingView was called")
        
        viewModel.hideLoadingView = {
            expectation.fulfill()
        }
        
        viewModel.fetchPullRequests()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchPullRequests_ShouldSuccess() {
        let pullRequest1 = PullRequest(id: 1, title: "PullRequest1", url: "", user: User(login: "User1", avatarUrl: ""), body: "", date: "")
        let pullRequest2 = PullRequest(id: 1, title: "PullRequest2", url: "", user: User(login: "User2", avatarUrl: ""), body: "", date: "")
        
        let mock = [pullRequest1, pullRequest2]
        serviceMock.pullRequestsMock = mock
        
        let expectation = XCTestExpectation(description: "reloadPullRequests was called")
        
        viewModel.reloadPullRequests = {
            expectation.fulfill()
        }
        
        viewModel.fetchPullRequests()
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertEqual(viewModel.pullRequests.count, 2)
        XCTAssertEqual(viewModel.pullRequests.first?.title, "PullRequest1")
    }
    
    func testFetchPullRequests_ShouldFailure() {
        serviceMock.isErrorFlow = true
        
        let expectation = XCTestExpectation(description: "showErrorView was called")
        
        viewModel.showErrorView = {
            expectation.fulfill()
        }
        
        viewModel.fetchPullRequests()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchPullRequests_WhenLoading_ShoulNotFetchPullRequests() {
        viewModel.isLoading = true
        viewModel.fetchPullRequests()
        
        XCTAssertTrue(viewModel.pullRequests.isEmpty)
    }
}
