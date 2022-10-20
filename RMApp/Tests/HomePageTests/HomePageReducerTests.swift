import ComposableArchitecture
import Helpers

import XCTest
@testable import HomePage

@MainActor
final class HomePageReducerTests: XCTestCase {
    func testBasics() async throws {
        let store = TestStore(
            initialState: HomePageReducer.State(),
            reducer: HomePageReducer()
        )

        let error = AppError.unknown.toEquatableError()
        _ = await store.send(.showError(error)) { state in
            state.error = error
            state.loading = false
        }

        _ = await store.send(.loadData) { state in
            state.loading = true
            state.error = nil
        }

    }
}


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
