import SwiftUI
import UniformTypeIdentifiers

struct Disk: Codable, Transferable {
    let id: UUID
    let weight: Int
    
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .disk)
    }
}

extension Disk: Identifiable, Equatable {}

extension UTType {
    static let disk = UTType(exportedAs: "cool.antics.Tower-of-Hanoi")
}

extension Disk {
    static var `default` = [
        Disk(id: UUID(), weight: 0),
        Disk(id: UUID(), weight: 1),
        Disk(id: UUID(), weight: 2),
        Disk(id: UUID(), weight: 3),
        Disk(id: UUID(), weight: 4)
    ]
}
