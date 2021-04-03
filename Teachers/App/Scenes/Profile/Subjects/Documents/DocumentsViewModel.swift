//
//  DocumentsViewModel.swift
//  Teachers
//

import Foundation

struct DocumentsViewModel {
    private let router: SubjectRouter
    let documents: [DocumentCellViewModel]
    var numberOfItems: Int { documents.count + 1}
    var onNewDocumentTap: (()->())? = nil

    init(router: SubjectRouter, documents: [DocumentCellViewModel], onNewDocumentTap: (()->())? = nil) {
        self.router = router
        self.documents = documents
    }
    
    func documentViewModel(at index: Int) -> DocumentCellViewModel? {
        guard index >= 0, index < documents.count else { return nil }
        return documents[index]
    }
    
    func isLastItem(index: Int) -> Bool {
        return index == documents.count
    }
}

extension DocumentsViewModel {
    static var mock = DocumentsViewModel(router: SubjectRouter(),
        documents: [
        DocumentCellViewModel(documentType: .doc, name: "Doc..Name.doc", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
            print("more options tapped for document Doc..Name.doc")
        }),
        DocumentCellViewModel(documentType: .jpg, name: "Doc..Name.jpg", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
            print("more options tapped for document Doc..Name.jpg")
        }),
        DocumentCellViewModel(documentType: .mp4, name: "Doc..Name.mp4", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
            print("more options tapped for document Doc..Name.mp4")
        }),
        DocumentCellViewModel(documentType: .pdf, name: "Doc..Name.pdf", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
            print("more options tapped for document Doc..Name.pdf")
        }),
        DocumentCellViewModel(documentType: .zip, name: "Doc..Name.zip", sizeAndDate: "12 MB • Yesterday", onMoreOptionsTapped: {
            print("more options tapped for document Doc..Name.zip")
        }),
    ]) {
        print("New Document Tapped")
    }
}
