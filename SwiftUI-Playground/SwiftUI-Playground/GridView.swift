//
//  GridView.swift
//  SwiftUI-Playground
//
//  Created by kawaharadai on 2022/06/30.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        VStack {
            // グリッド表示（スクロールが必要なものはVGridなどで代用する）
            Grid(horizontalSpacing: 1,
                 verticalSpacing: 1) {
                GridRow {
                    Text("GridRow 1")
                    ForEach(0..<2) { _ in Color.red }
                        .frame(width: 50, height: 50)
                }
                // 仕切り線をvertical方面だけにしてhorizontal方面には余分な仕切りが入らないようにする
                Divider()
                    .gridCellUnsizedAxes(.horizontal)
                    .background(Color.red)

                GridRow {
                    Text("GridRow 2")
                    ForEach(0..<6) { _ in Color.green }
                        .frame(width: 50, height: 50)
                }
                GridRow {
                    Text("GridRow 3")
                    Color.red.frame(width: 50, height: 50)
                    // 一部セルの座標を変える
                    Color.blue.frame(width: 10, height: 10)
                        .gridCellAnchor(.topTrailing)
                    Color.green.frame(width: 20, height: 20)
                        .gridCellAnchor(UnitPoint(x: 0.8, y: 0.9))
                    Color.yellow.frame(width: 20, height: 20)
                        .gridCellColumns(2) // セル個数分配置方向にずらす（2つ分ずらす）
                }
            }

            // 横スクロールのグリッド表示、遅延作成版、1行ならStackViewで良いかも
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(60)), GridItem(.fixed(60))]) {
                    ForEach(0x1f600...0x1f679, id: \.self) { value in
                        VStack {
                            Text("LazyHGrid")
                            Text(emoji(value))
                                .font(.largeTitle)
                        }
                    }
                    .background(Color.blue)
                }.frame(height: 150).background(Color.red)
            }

            // 縦スクロールのグリッド表示、遅延作成版、単純なグリッドならGridViewの方が良い（縦横スペース指定できる）
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()),
                                    GridItem(.flexible()),
                                    GridItem(.flexible())],
                          alignment: .center,
                          spacing: 1) {
                    ForEach(0x1f600...0x1f679, id: \.self) { value in
                        VStack {
                            Text("LazyVGridLazyVGrid")
                            Text(emoji(value))
                                .font(.largeTitle)
                        }
                    }.frame(height: 100).background(Color.blue)
                }.background(Color.red)
            }
            Spacer()
        }
    }
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
