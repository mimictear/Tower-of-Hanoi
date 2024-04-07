//
//  DiskView.swift
//  Tower of Hanoi
//
//  Created by ANDREY VORONTSOV on 07.04.2024.
//

import SwiftUI

struct DiskView: View {
    let disk: Disk
    
    private var color: Color {
        diskColors[disk.weight]
    }
    
    var body: some View {
        RoundedRectangle(cornerSize: diskCornerRadius)
            .frame(height: diskHeight)
            .foregroundStyle(color)
            .padding(.horizontal)
            .draggable(disk)
    }
}

private let diskHeight: CGFloat = 32
private let diskCornerRadius: CGSize = .init(width: 12, height: 12)
private let diskColors: [Color] = [.red, .orange, .yellow, .green, .blue]

#Preview {
    DiskView(disk: Disk.default[1])
}
