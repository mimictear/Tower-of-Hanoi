//
//  RodView.swift
//  Tower of Hanoi
//
//  Created by ANDREY VORONTSOV on 07.04.2024.
//

import SwiftUI

struct RodView: View {
    let isTargeted: Bool
    let disks: [Disk]
    
    private var rodBackgroundColor: Color {
        isTargeted ? .green.opacity(0.2) : .gray.opacity(0.2)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerSize: rodCornerRadius)
                    .foregroundStyle(rodBackgroundColor)
                
                VStack(alignment: .center) {
                    
                    ForEach(disks) { disk in
                        DiskView(disk: disk)
                            .shadow(radius: 1, x: 1, y: 1)
                            .frame(width: getDiskWidth(weight: disk.weight, size: proxy.size))
                    }
                    
                }
                .padding(.bottom)
            }
        }
    }
    
    // TODO: make it better ;)
    private func getDiskWidth(weight: Int, size: CGSize) -> CGFloat {
        let maxWidth = size.width

        switch weight {
        case 0: return maxWidth / 2.8
        case 1: return maxWidth / 2.2
        case 2: return maxWidth / 1.9
        case 3: return maxWidth / 1.6
        case 4: return maxWidth / 1.4
        default: return maxWidth
        }
    }
}

private let rodCornerRadius: CGSize = .init(width: 12, height: 12)

#Preview {
    RodView(isTargeted: true, disks: Disk.default)
}
