import SwiftUI

struct BookList: View {
    @EnvironmentObject var bookStore: DataStore
    @State var isPresentingBookForm = false
    @State var newBookFormData = Book.FormData()
    
    var body: some View {
        VStack {
            List(bookStore.books) { book in
                NavigationLink(destination: BookDetail(book: book)) {
                    BookRow(book: book)
                }
            }
        }
        .navigationTitle("Books - sl706")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Create") { isPresentingBookForm.toggle() }
            }
        }
        .sheet(isPresented: $isPresentingBookForm){
            NavigationStack{
                BookForm(data: $newBookFormData)
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Save") { isPresentingBookForm.toggle()
                                let newBook = Book.create(from: newBookFormData)
                                bookStore.create(newBook)
                                isPresentingBookForm = false
                                newBookFormData = Book.FormData()
                            }
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel") {
                                isPresentingBookForm.toggle()
                                newBookFormData = Book.FormData()
                            }
                        }
                    }
                    .padding()
            }
        }
        
    }
}

struct BookRow: View {
    let book: Book
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: book.coverUrl,
                       content: { image in
                image.resizable()},
                       placeholder: {
                if book.coverUrl != nil {
                    ProgressView()
                } else {
                    Image(systemName: "book")
                        .padding()
                }
            }
            )
            .frame(maxWidth: 30, maxHeight: 48)
            
            VStack(alignment: .leading){
                Text(book.title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(book.author)
                    .font(.caption)
            }
            Spacer()
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BookList().environmentObject(DataStore())
        }
    }
}
