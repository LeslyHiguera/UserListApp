//
//  UserListAppTests.swift
//  UserListAppTests
//
//  Created by Lesly Dahian Higuera Martínez on 11/03/23.
//

import XCTest
@testable import UserListApp

final class UserListAppTests: XCTestCase {
    
    // MARK: - Private Properties
    private var requestExpectation: XCTestExpectation?
    
    // MARK: - Subject under test
    private var viewModel: UsersListViewModel!
    
    // MARK: - Mock
    private var repositoryMock: UsersListRepositoryMock!

    override func setUp()  {
        super.setUp()
        repositoryMock = UsersListRepositoryMock()
        viewModel = UsersListViewModel(repository: repositoryMock)
    }

    override func tearDown()  {
        super.tearDown()
        repositoryMock = nil
        viewModel = nil
    }
    
    // MARK: - Tests getUser
    
    func testGetUsersListEvents() {
        // Given
        repositoryMock.response = UsersListFake.values
        // When
        getUsersListEvents(isLocalData: false)
        // Then
        XCTAssertEqual(requestExpectation?.expectationDescription, ResponseExpectation.ok.rawValue)
    }
    
    func testGetUsersLocallyListEvents() {
        // Given
        repositoryMock.response = UsersListFake.values
        // When
        getUsersListEvents(isLocalData: true)
        // Then
        XCTAssertEqual(requestExpectation?.expectationDescription, ResponseExpectation.ok.rawValue)
    }

}

private extension UserListAppTests {
    
    func getUsersListEvents(isLocalData: Bool) {
        requestExpectation = expectation(description: ResponseExpectation.go.rawValue)
        if isLocalData {
            viewModel.getUsersListLocally()
        } else {
            viewModel.getUsersList()
        }
        viewModel.outputEvents.observe { [weak self] event in
            self?.validateEvents(event: event)
        }
        
        if let requestExpectation = requestExpectation {
            wait(for: [requestExpectation], timeout: 1)
        }
        
    }
    
    private func validateEvents(event: UsersListViewModelOutput) {
        if case .didGetData = event {
            requestExpectation?.expectationDescription = ResponseExpectation.ok.rawValue
            requestExpectation?.fulfill()
        }
        if case .errorMessage = event {
            requestExpectation?.expectationDescription = ResponseExpectation.error.rawValue
            requestExpectation?.fulfill()
        }
    }
    
}
