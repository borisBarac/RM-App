import Foundation
import Apollo
import ApolloAPI

public class MockInterceptor: ApolloInterceptor, Cancellable {
    var mockResponceString: String? = nil

    init(mockResponceString: String? = nil) {
        self.mockResponceString = mockResponceString
    }

    public func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
            let mockCode = mockResponceString != nil ? 200 : 500
            let httpMock = HTTPURLResponse(url: request.graphQLEndpoint, statusCode: mockCode, httpVersion: "HTTP/1.1", headerFields: request.additionalHeaders)


            chain.proceedAsync(request: request,
                               response: HTTPResponse(response: httpMock!,
                                                      rawData: (mockResponceString ?? "").data(using: .utf8)!,
                                                      parsedResponse: nil),
                               completion: completion)
        }

    public func cancel() {
    }
}

// Test helper
public extension MockInterceptor {
    static func passMock(with mock: String) -> MockInterceptor {
        MockInterceptor(mockResponceString: mock)
    }

    static func failMock() -> MockInterceptor {
        // defaults to fail
        MockInterceptor()
    }
}

