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
            Grid(alignment: .center,
                 horizontalSpacing: 1,
                 verticalSpacing: 1) {
                GridRow {
                    Text("GridRow 1")
                    ForEach(0..<2) { _ in Color.red }
                }.frame(width: 50, height: 50)
                GridRow {
                    Text("GridRow 2")
                    ForEach(0..<6) { _ in Color.green }
                }.frame(width: 50, height: 50)
                GridRow {
                    Text("GridRow 3")
                    ForEach(0..<4) { _ in Color.blue }
                }.frame(width: 50, height: 50)
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
