import Foundation

// MARK: Liskov Substitution Principle (LSP)

/*
 Derived or child classes/structures must be substitutiable for their base or parent classes
 */


// this is gonna be a chil class
enum APIError: Error {
    case invalidURL
    case invalidResource
    case invalidStatusCode
}

struct MockUserService {
    func fetchUser() async throws {
        do {
            // LSP means that I could substitute the error below for any other parent class error and that is the case here
            throw APIError.invalidStatusCode
        } catch {
            print("Error: \(error)")
        }
    }
}

let mockUserService = MockUserService()
await mockUserService.fetchUser()
