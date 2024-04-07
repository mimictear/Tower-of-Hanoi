//
//  ContentView.swift
//  Tower of Hanoi
//
//  Created by ANDREY VORONTSOV on 07.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var firstRod = Disk.default
    @State private var secondRod = [Disk]()
    @State private var thirdRod = [Disk]()
    
    // TODO: add sort of a congratulations
    var body: some View {
        HStack(spacing: 12) {
            RodView(isTargeted: false, disks: firstRod)
                .dropDestination(for: Disk.self) { droppedDisks, _ in
                    guard let droppedDisk = droppedDisks.first else {
                        return false
                    }
                    let canDrop = dropDiskIfPossible(droppedDisk, targetRod: firstRod)
                    
                    if canDrop {
                        firstRod.insert(droppedDisk, at: 0)
                        
                        thirdRod.removeAll(where: { $0 == droppedDisk })
                        secondRod.removeAll(where: { $0 == droppedDisk })
                    }
                    return canDrop
                }
            
            RodView(isTargeted: false, disks: secondRod)
                .dropDestination(for: Disk.self) { droppedDisks, _ in
                    guard let droppedDisk = droppedDisks.first else {
                        return false
                    }
                    let canDrop = dropDiskIfPossible(droppedDisk, targetRod: secondRod)
                    
                    if canDrop {
                        secondRod.insert(droppedDisk, at: 0)
                        
                        firstRod.removeAll(where: { $0 == droppedDisk })
                        thirdRod.removeAll(where: { $0 == droppedDisk })
                    }
                    return canDrop
                }
            
            RodView(isTargeted: false, disks: thirdRod)
                .dropDestination(for: Disk.self) { droppedDisks, _ in
                    guard let droppedDisk = droppedDisks.first else {
                        return false
                    }
                    let canDrop = dropDiskIfPossible(droppedDisk, targetRod: thirdRod)
                    
                    if canDrop {
                        thirdRod.insert(droppedDisk, at: 0)
                        
                        firstRod.removeAll(where: { $0 == droppedDisk })
                        secondRod.removeAll(where: { $0 == droppedDisk })
                    }
                    return canDrop
                }
        }
        .padding()
    }
    
    private func dropDiskIfPossible(_ disk: Disk, targetRod: [Disk]) -> Bool {
        let heaviestDiskWeight = targetRod.max(by: { $0.weight < $1.weight })?.weight ?? 0
        return targetRod.isEmpty || heaviestDiskWeight > disk.weight
    }
}

#Preview {
    ContentView()
        .previewInterfaceOrientation(.landscapeRight)
}
