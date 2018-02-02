
import UIKit

protocol DocumentGeneratorProtocol {
    /* template method */
    func generate()
    /* common algorithm steps */
    func buildHeader()
    func buildBody()
    func save()
}

class DocumentGenerator: DocumentGeneratorProtocol {
    func generate() {
        buildHeader()
        buildBody()
        save()
    }
    
    func buildHeader() {
        print("Executed common operations to build document header.")
    }
    
    func buildBody() {
        print("Executed common operations to build document body.")
    }
    
    func save() {
        print("Saved to disk.\n")
    }
}

final class PDFDocumentGenerator: DocumentGenerator {
    override func buildHeader() {
        super.buildHeader()
        print("Built PDF header.")
    }
    
    override func buildBody() {
        super.buildBody()
        print("Built PDF body.")
    }
}

final class HTMLDocumentGenerator: DocumentGenerator {
    override func buildHeader() {
        super.buildHeader()
        print("Built HTML header.")
    }
    
    override func buildBody() {
        super.buildBody()
        print("Built HTML body.")
        additionalOperations()
    }
    
    private func additionalOperations() {
        print("Additional operations for HTML doc made.")
    }
}

enum GeneratorType {
    case html, pdf
}

final class DocumentFactory {
    func generator(_ type: GeneratorType) -> DocumentGeneratorProtocol {
        switch type {
        case .html:
            return HTMLDocumentGenerator()
        case .pdf:
            return PDFDocumentGenerator()
        }
    }
}

/* Usage: */

let factory = DocumentFactory()
let pdfGenerator: DocumentGeneratorProtocol = factory.generator(.pdf)
let htmlGenerator: DocumentGeneratorProtocol = factory.generator(.html)

pdfGenerator.generate()
htmlGenerator.generate()

