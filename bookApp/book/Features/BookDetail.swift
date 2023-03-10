import SwiftUI

struct BookDetail: View {
    let book: Book
    @EnvironmentObject var bookStore: DataStore
    //@State var isOnReadingList = false
    
    var body: some View {
        ScrollView {
            AsyncImage(url: book.coverUrl,
                       content: { image in
                image.resizable()
                    .frame(maxWidth: 150, maxHeight: 200)
            },
                       placeholder: {
                if book.coverUrl != nil {
                    ProgressView()
                } else {
                    Image(systemName: "book")
                        .frame(maxWidth: 150, maxHeight: 200)
                }
            }
            )
            Text(book.title)
                .font(.largeTitle)
            Text(book.author)
                .font(.headline)
            Spacer()
            SynopsisDisplay(book: book)
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(bookStore.isOnList(book) ? "Remove from List": "Add to List") {
                    bookStore.isOnList(book) ? bookStore.removeFromList(book) : bookStore.addToList(book)
                }
            }
        }
    }
}

struct SynopsisDisplay: View {
    let book: Book
    @EnvironmentObject var synopsisLoader: SynopsisLoader
    
    var body: some View {
        VStack {
            switch synopsisLoader.state {
            case .idle: Color.clear
            case .loading: ProgressView()
            case .failed: Text("Could not load description")
            case .success(let response): Text(response).font(.caption).padding()
            }
        }
        .task { await synopsisLoader.loadSynopsisData(book: book) }
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: Book.previewData[0]).environmentObject(DataStore())
            .environmentObject(SynopsisLoader(apiClient: OpenLibraryAPIServiceClient()))
    }
}
