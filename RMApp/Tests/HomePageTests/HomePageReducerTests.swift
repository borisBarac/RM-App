import ComposableArchitecture
import Helpers
import DetailsPage
import XCTest
@testable import HomePage

@MainActor
final class HomePageReducerTests: XCTestCase {
    var store = TestStore(initialState: HomePageReducer.State(),
                                 reducer: HomePageReducer())

    override func setUp() async throws {
        try await super.setUp()
        store = TestStore(initialState: HomePageReducer.State(),
                          reducer: HomePageReducer())
    }

    func testSendError() async throws {
        let error = AppError.unknown.toEquatableError()
        _ = await store.send(.showError(error)) { state in
            state.error = error
            state.loading = false
        }
    }

    func testLoadDataFlow() async throws {
        _ = await store.send(.loadData) { state in
            state.loading = true
        }
        _ = await store.receive(.dataLoaded(mockArrayGlobal)) { state in
            state.items = mockArrayGlobal
            state.loading = false
        }
    }

    func testLoadDetailsFlow() async throws {
        let mockArray = mockArrayGlobal
        _ = await store.send(.loadData) { state in
            state.loading = true
        }
        _ = await store.receive(.dataLoaded(mockArray)) { state in
            state.items = mockArray
            state.loading = false
        }
        _ = await store.send(.setDetailsPresented(true)) { state in
            state.detailsPresented = true
            state.detailState = DetailsPageReducer.State()
        }
        _ = await store.send(.detail(.doSomething(mockArray.first!))) { state in
            state.detailState?.details = mockArray.first!
        }
        _ = await store.send(.setDetailsPresented(false)) { state in
            state.detailsPresented = false
            state.detailState = nil
        }
    }

}

private let mockArrayGlobal = ["f1", "f2", "f3"]


//    @MainActor
//    final class LoginCoreTests: XCTestCase {
//      func testFlow_Success_TwoFactor_Integration() async {
//        let store = TestStore(
//          initialState: Login.State(),
//          reducer: Login()
//        )
//
//        store.dependencies.authenticationClient.login = { _ in
//          AuthenticationResponse(token: "deadbeefdeadbeef", twoFactorRequired: true)
//        }
//        store.dependencies.authenticationClient.twoFactor = { _ in
//          AuthenticationResponse(token: "deadbeefdeadbeef", twoFactorRequired: false)
//        }
//
//        await store.send(.emailChanged("2fa@pointfree.co")) {
//          $0.email = "2fa@pointfree.co"
//        }
//        await store.send(.passwordChanged("password")) {
//          $0.password = "password"
//          $0.isFormValid = true
//        }
//        await store.send(.loginButtonTapped) {
//          $0.isLoginRequestInFlight = true
//        }
//        await store.receive(
//          .loginResponse(
//            .success(AuthenticationResponse(token: "deadbeefdeadbeef", twoFactorRequired: true))
//          )
//        ) {
//          $0.isLoginRequestInFlight = false
//          $0.twoFactor = TwoFactor.State(token: "deadbeefdeadbeef")
//        }
//        await store.send(.twoFactor(.codeChanged("1234"))) {
//          $0.twoFactor?.code = "1234"
//          $0.twoFactor?.isFormValid = true
//        }
//        await store.send(.twoFactor(.submitButtonTapped)) {
//          $0.twoFactor?.isTwoFactorRequestInFlight = true
//        }
//        await store.receive(
//          .twoFactor(
//            .twoFactorResponse(
//              .success(AuthenticationResponse(token: "deadbeefdeadbeef", twoFactorRequired: false))
//            )
//          )
//        ) {
//          $0.twoFactor?.isTwoFactorRequestInFlight = false
//        }
//      }
