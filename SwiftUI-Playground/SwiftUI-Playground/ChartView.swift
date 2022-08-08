//
//  BarChartView.swift
//  SwiftUI-Playground
//
//  Created by kawaharadai on 2022/08/08.
//

import SwiftUI
import Charts

struct BarChartView: View {
    static let dataSet1 = [
        ChartEntity(title: "タイトル1", value: 10, color: .red),
        ChartEntity(title: "タイトル1", value: 20, color: .blue),
        ChartEntity(title: "タイトル3", value: 30, color: .green),
        ChartEntity(title: "タイトル4", value: 40, color: .orange)
    ]
    static let dataSet2 = [
        ChartEntity(title: "タイトル1", value: 50, color: .red),
        ChartEntity(title: "タイトル2", value: 90, color: .blue),
        ChartEntity(title: "タイトル3", value: 30, color: .green),
    ]
    @State var activeDataSet = dataSet1
    @State private var dataSetSelection = 0

    var body: some View {
        VStack {
            Text("縦棒グラフ")
            Chart(BarChartView.dataSet1) { dataPoint in
                // 軸側(可変ではない方)が同じならグラフは合体する
                BarMark(
                    x: .value("タイトル", dataPoint.title),
                    y: .value("値", dataPoint.value)
                )
                .foregroundStyle(dataPoint.color)
            }
            .frame(height: 200)
            Text("横棒グラフ")
            // ForEachの書き方もできる（内容は上と一緒）
            Chart {
                ForEach(BarChartView.dataSet2) { dataPoint in
                    BarMark(
                        x: .value("Value", dataPoint.value),
                        y: .value("Category", dataPoint.title)
                    )
                    .foregroundStyle(dataPoint.color)
                }
            }
            .frame(height: 200)
            Text("可変グラフ")
            Chart(activeDataSet) { dataPoint in
                // 軸側(可変ではない方)が同じならグラフは合体する
                BarMark(
                    x: .value("タイトル", dataPoint.title),
                    y: .value("値", dataPoint.value)
                )
                .foregroundStyle(dataPoint.color)
            }
            .frame(height: 200)

            Picker("data", selection: $dataSetSelection) {
                Text("データセット2").tag(1)
                Text("データセット1").tag(0)
            }
            .onChange(of: dataSetSelection) { newValue in
                withAnimation {
                    switch newValue {
                    case 0:
                        self.activeDataSet = BarChartView.dataSet1
                    case 1:
                        self.activeDataSet = BarChartView.dataSet2
                    default:
                        return
                    }
                }
            }
            Spacer()
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}

struct ChartEntity: Identifiable, Hashable {
    let title: String
    let value: Double
    let color: Color
    var id: String {
        return title + String(value)
    }
}
