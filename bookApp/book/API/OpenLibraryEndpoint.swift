import Foundation

struct OpenLibraryEndpoint {
    
    static func path(_ id: String) -> String {
        return "https://openlibrary.org/works/\(id).json"
    }
    
}

