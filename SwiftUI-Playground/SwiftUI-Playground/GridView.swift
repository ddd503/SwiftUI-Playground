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
            Spacer()
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
