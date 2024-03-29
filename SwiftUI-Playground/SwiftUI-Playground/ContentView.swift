//
//  ContentView.swift
//  SwiftUI-Playground
//
//  Created by kawaharadai on 2022/06/24.
//

import SwiftUI

enum Content: Int, Identifiable, CaseIterable {
    var id: Int { rawValue }

    case stack
    case grid
    case layout
    case gauge
    case datePicker
    case barChart
    case lineChart
    case pasteButton
    case colorGradation

    var title: String {
        switch self {
        case .stack: return "Stack"
        case .grid: return "Grid"
        case .layout: return "Layout"
        case .gauge: return "Gauge"
        case .datePicker: return "DatePicker"
        case .barChart: return "BarChart"
        case .lineChart: return "LineChart"
        case .pasteButton: return "PasteButton"
        case .colorGradation: return "ColorGradation"
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("SwiftUIの遊び場")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            NavigationView {
                List(Content.allCases, id: \Content.id) { content in
                    switch content {
                    case .stack:
                        NavigationLink(destination: StackView()) {
                            Text(content.title)
                        }
                    case .grid:
                        NavigationLink(destination: GridView()) {
                            Text(content.title)
                        }
                    case .layout:
                        NavigationLink(destination: LayoutView()) {
                            Text(content.title)
                        }
                    case .gauge:
                        NavigationLink(destination: GaugeView()) {
                            Text(content.title)
                        }
                    case .datePicker:
                        NavigationLink(destination: DatePickerView()) {
                            Text(content.title)
                        }
                    case .barChart:
                        NavigationLink(destination: BarChartView()) {
                            Text(content.title)
                        }
                    case .lineChart:
                        NavigationLink(destination: LineChartView()) {
                            Text(content.title)
                        }
                    case .pasteButton:
                        NavigationLink(destination: PasteButtonView()) {
                            Text(content.title)
                        }
                    case .colorGradation:
                        NavigationLink(destination: ColorGradationView()) {
                            Text(content.title)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
