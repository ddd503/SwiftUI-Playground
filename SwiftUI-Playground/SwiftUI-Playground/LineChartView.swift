//
//  LineChartView.swift
//  SwiftUI-Playground
//
//  Created by kawaharadai on 2022/08/20.
//

import SwiftUI
import Charts

struct LineChartView: View {
    static let dataSet1 = [
        ChartEntity(title: "月曜", value: 10, color: .red),
        ChartEntity(title: "火曜", value: 20, color: .blue),
        ChartEntity(title: "水曜", value: 30, color: .green),
        ChartEntity(title: "木曜", value: 40, color: .orange),
        ChartEntity(title: "金曜", value: 50, color: .yellow),
        ChartEntity(title: "土曜", value: 60, color: .gray),
        ChartEntity(title: "日曜", value: 70, color: .black)
    ]
    static let dataSet2 = [
        ChartEntity(title: "月曜", value: 10, color: .blue),
        ChartEntity(title: "火曜", value: 50, color: .blue),
        ChartEntity(title: "水曜", value: 10, color: .green),
        ChartEntity(title: "木曜", value: 80, color: .orange),
        ChartEntity(title: "金曜", value: 20, color: .yellow),
        ChartEntity(title: "土曜", value: 60, color: .gray),
        ChartEntity(title: "日曜", value: 100, color: .black)
    ]

    var body: some View {
        Chart {
            ForEach(LineChartView.dataSet1) { dataPoint in
                LineMark(
                    x: .value("Category", dataPoint.title),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("User", "Aさん"))
            }
            ForEach(LineChartView.dataSet2) { dataPoint in
                PointMark(
                    x: .value("Category", dataPoint.title),
                    y: .value("Value", dataPoint.value)
                )
                .foregroundStyle(by: .value("User", "Bさん"))
            }
        }
        .frame(height: 200)
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
    }
}
