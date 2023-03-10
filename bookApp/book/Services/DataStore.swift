import SwiftUI

class DataStore: ObservableObject {
    
    @Published var books: [Book] = Book.previewData // our starting state
    @Published var booksOnReadingList: [Book] = []
    
    func create(_ book: Book) {
        books.append(book)
    }
    
    func isOnList(_ book: Book) -> Bool {
        booksOnReadingList.contains(where: {$0.id == book.id})
    }

    func addToList(_ book: Book) {
        booksOnReadingList.append(book)
    }
    
    func removeFromList(_ book: Book) {
        if let index = booksOnReadingList.firstIndex(where: { $0.id == book.id }) {
            booksOnReadingList.remove(at: index)
        }
    }
}
