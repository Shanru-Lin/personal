import SwiftUI

struct BookForm: View {
    @Binding var data: Book.FormData
    
    var body: some View {
        Form {
            TextFieldWithLabel(label: "Id", text: $data.id, prompt: "Enter an id")
            TextFieldWithLabel(label: "Title", text: $data.title, prompt: "Enter a title")
            TextFieldWithLabel(label: "Author", text: $data.author, prompt: "Enter an author")
        }
    }
}

struct TextFieldWithLabel: View {
    let label: String
    @Binding var text: String
    var prompt: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .bold()
                .font(.caption)
            TextField(label, text: $text, prompt: prompt != nil ? Text(prompt!) : nil)
                .padding(.bottom, 20)
        }
    }
}

struct BookForm_Previews: PreviewProvider {
    static var previews: some View {
        BookForm(data: Binding.constant(Book.previewData[0].dataForForm))
    }
}
