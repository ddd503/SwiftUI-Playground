//
//  StackView.swift
//  SwiftUI-Playground
//
//  Created by kawaharadai on 2022/06/26.
//

import SwiftUI

struct StackView: View {
    let colors: [Color] =
    [.red, .orange, .yellow, .green, .blue, .purple]
    var body: some View {
        // 縦並べ
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            // 横並べ
            HStack(spacing: 10) {
                ForEach(
                    0...5,
                    id: \.self
                ) {
                    Text("Item \($0)")
                }
            }
            // 横並べをスクロールで表示されるまで生成しない形で
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(1...100, id: \.self) {
                        Text("Column \($0)")
                    }
                }
            }
            .frame(height: 50)
            .scrollIndicators(.hidden)

            // 縦並べをスクロールで表示されるまで生成しない形でScrollViewは基本.verticalらしい
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(1...100, id: \.self) {
                        Text("Row \($0)")
                    }
                }
            }.frame(height: 300)
            // Z軸で10ずつズラして100四方の正方形を配置
            ZStack {
                ForEach(
                    0..<colors.count,
                    id: \.self
                ) {
                    Rectangle()
                        .fill(colors[$0])
                        .frame(width: 100, height: 100)
                        .offset(x: CGFloat($0) * 10.0,
                                y: CGFloat($0) * 10.0)
                }
            }
            Spacer()
        }
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
