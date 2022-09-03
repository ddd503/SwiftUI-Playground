//
//  ColorGradationView.swift
//  SwiftUI-Playground
//
//  Created by kawaharadai on 2022/09/03.
//

import SwiftUI

struct ColorGradationView: View {
    var body: some View {
        HStack {
            // 外側に影入れた
            Rectangle()
                .fill(.blue.gradient.shadow(.drop(radius: 10)))
                .frame(width:120, height:120)
            Rectangle()
                .fill(.orange.gradient)
                .frame(width:120, height:120)
            // 内側に影入れた
            Rectangle()
                .fill(.green.shadow(.inner(radius: 10)))
                .frame(width:120, height:120)
        }
    }
}

struct ColorGradationView_Previews: PreviewProvider {
    static var previews: some View {
        ColorGradationView()
    }
}
