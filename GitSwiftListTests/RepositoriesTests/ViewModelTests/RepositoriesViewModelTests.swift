//
//  RepositoriesViewModelTests.swift
//  GitSwiftList
//
//  Created by Ana Carolina Camargo Borba on 18/01/25.
//

import XCTest
@testable import GitSwiftList

class RepositoriesViewModelTests: XCTestCase {
    
    var viewModel: RepositoriesViewModel!
    var serviceMock: RepositoriesServiceMock!
    
    override func setUp() {
        super.setUp()
        serviceMock = RepositoriesServiceMock()
        viewModel = RepositoriesViewModel(service: serviceMock)
    }
    
    override func tearDown() {
        viewModel = nil
        serviceMock = nil
        super.tearDown()
    }
    
    func testFetchRepositories_ShouldShowLoadingView() {
        let expectation = XCTestExpectation(description: "showLoadingView was called")
        
        viewModel.showLoadingView = {
            expectation.fulfill()
        }
        
        viewModel.fetchRepositories()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchRepositories_ShouldHideLoadingView() {
        let expectation = XCTestExpectation(description: "hideLoadingView was called")
        
        viewModel.hideLoadingView = {
            expectation.fulfill()
        }
        
        viewModel.fetchRepositories()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchRepositories_ShouldSuccess() {
        let repository1 = Repository(id: 1, name: "Repository1", owner: Owner(login: "Owner1", avatarUrl: ""), description: "", url: "", starsCount: 1, forksCount: 1)
        let repository2 = Repository(id: 2, name: "Repository2", owner: Owner(login: "Owner2", avatarUrl: ""), description: "", url: "", starsCount: 2, forksCount: 2)
        
        let mock = [repository1, repository2]
        serviceMock.repositoriesMock = mock
        
        let expectation = XCTestExpectation(description: "reloadRepositories was called")
        
        viewModel.reloadRepositories = {
            expectation.fulfill()
        }
        
        viewModel.fetchRepositories()
        wait(for: [expectation], timeout: 1.0)
        
        XCTAssertEqual(viewModel.repositories.count, 2)
        XCTAssertEqual(viewModel.repositories.first?.name, "Repository1")
    }
    
    func testFetchRepositories_ShouldFailure() {
        serviceMock.isErrorFlow = true
        
        let expectation = XCTestExpectation(description: "showErrorView was called")
        
        viewModel.showErrorView = {
            expectation.fulfill()
        }
        
        viewModel.fetchRepositories()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchRepositories_WhenLoading_ShouldNotFetchRepositories() {
        viewModel.isLoading = true
        viewModel.fetchRepositories()
        
        XCTAssertTrue(viewModel.repositories.isEmpty)
    }
}
