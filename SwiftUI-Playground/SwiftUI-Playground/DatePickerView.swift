//
//  DatePickerView.swift
//  SwiftUI-Playground
//
//  Created by kawaharadai on 2022/08/08.
//

import SwiftUI

struct DatePickerView: View {
    @State var userSelectedDates: Set<DateComponents> = []
    // 環境変数
    @Environment(\.calendar) var calendar
    @Environment(\.timeZone) var timeZone
    // 選択可能日付範囲を設定している
    var bounds: Range<Date> {
        let start = calendar.date(from: DateComponents(
            timeZone: timeZone, year: 2022, month: 6, day: 6))!
        let end = calendar.date(from: DateComponents(
            timeZone: timeZone, year: 2022, month: 6, day: 16))!
        return start ..< end
    }

    var body: some View {
        // View毎に簡易的なCellで分けてくれる
        Form {
            MultiDatePicker("Select some dates", selection: $userSelectedDates)
            MultiDatePicker("Dates Available", selection: $userSelectedDates, in: bounds)
            Section {
                Text("Selected dates:\(userSelectedDates.description)")
            }
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
