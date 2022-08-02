//
//  GaugeView.swift
//  SwiftUI-Playground
//
//  Created by kawaharadai on 2022/08/03.
//

import SwiftUI

struct GaugeView: View {
    let displayedProgress = 50
    var body: some View {
        VStack(spacing: 50) {
            Gauge(value: 23, in: 17...29) {
                Text("°C")
            } currentValueLabel: {
                Text("23")
            }
            .gaugeStyle(.accessoryCircular)
            .tint(Gradient(colors: [.green, .yellow, .orange]))

            Gauge(value: 80, in: 0...100) {} currentValueLabel: {
                Text("100")
            }
            .gaugeStyle(.accessoryLinear)
            .tint(Gradient(colors: [.green, .yellow, .orange]))

            Gauge(value: 50, in: 0...100) {
                Text("Default Gauge")
            } currentValueLabel: {
                Text("50%")
            } minimumValueLabel: {
                Text("0%")
            } maximumValueLabel: {
                Text("100%")
            }

            Gauge(value: 40, in: 0...100) {
            } currentValueLabel: {
                Text("40")
            }
            .gaugeStyle(.accessoryCircularCapacity)
            .tint(.green)

            Gauge(value: 40, in: 0...100) {
                Text("automatic")
            }
            .gaugeStyle(.automatic)

            Gauge(value: 40, in: 0...100) {
                Text("linearCapacity")
            }
            .gaugeStyle(.linearCapacity)
        }
        .padding()
    }
}

struct GaugeView_Previews: PreviewProvider {
    static var previews: some View {
        GaugeView()
    }
}
