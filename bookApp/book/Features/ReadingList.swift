import SwiftUI

struct ReadingList: View {
    @EnvironmentObject var bookStore: DataStore
    
    var body: some View {
        VStack(spacing: 3) {
            List(bookStore.booksOnReadingList) { book in
                BookRow(book: book)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            bookStore.removeFromList(book)
                        } label: { Label("Delete", systemImage: "trash") }
                    }
            }
        }
        .navigationTitle("ReadingList")
    }
}

struct ReadingList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ReadingList().environmentObject(DataStore())
        }
    }
}
