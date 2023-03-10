# "Book Manager": An iOS App <br />
<p>
     This is an app that allows you to track your reading list from a pre-populated list of books. To help you decide which books to add to your list, you’ll need to fetch the synopsis for each book from OpenLibrary with an API call. You can also add new books to the list, but you cannot edit them so far (this is a functionality coming soon).
</p>

<p align="center">
<img src= "create.gif" width="150" >
<img src= "list.gif" width="150" >
</p>

## Features and Structures

Initially, two lists are demonstarted, a list of books and a reading list. 

### - [x] View all books: BookList

* After one tappped on a book, If the book is not on the reading list, it says “Add to List”. If the book is on the reading list, it says “Remove from List”. And, clearly, that button adds and removes books on the reading list. You can view the reading list by tapping on its tab button. 

### - [x] Create a new book: BookForm and API

- On the Book list, one could also create a book via the upper right corner, unless it is included in the OpenLibrary (https://openlibrary.org/dev/docs/api/books). An OpenLibraryEndpoint and OpenLibraryAPIService supports the connection to the API.

### - [x] View details of a book: BookDetails and SynopsisLoader

- On the reading list, when tap on a book, one can see details about that book: the book cover, title, author, and the synopsis fetched from OpenLibrary via the SynopsisLoader.

### - [x] Add/remove books from the reading list: ReadingList and DataStore

- When viewing the details of a book, one could also add it into the reading list if it is not on the reading list, and remove it otherwise. The DataStore documents whether the books are on the reading list and not.

## Requirements

- iOS 16.0+
- Xcode 14.2


