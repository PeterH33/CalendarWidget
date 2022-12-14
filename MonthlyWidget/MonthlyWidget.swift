//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by Peter Hartnett on 8/24/22.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
   
    
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date())
    }

    //This is what goes into the app in the preview of the widget
    func getSnapshot(in context: Context, completion: @escaping (DayEntry) -> ()) {
        let entry = DayEntry(date: Date())
        completion(entry)
    }

    //Makes the timeline
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        var entries: [DayEntry] = []

        // Generate a timeline consisting of seven entries a day apart, starting from the current date.
        let currentDate = Date()
        for dayOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            let entry = DayEntry(date: startOfDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

//This is the data for populating the wid
struct DayEntry: TimelineEntry {
    let date: Date
    
}

struct MonthlyWidgetEntryView : View {
    var entry: DayEntry
    var config: MonthConfig
    
    init(entry: DayEntry) {
        self.entry = entry
        self.config = MonthConfig.determineConfig(from: entry.date)
    }

    var body: some View {
        
        ZStack{
            Image(config.backGroundImage)
                .resizable()
                .scaledToFit()
//            ContainerRelativeShape()
            //                .fill(config.backgroundColor)
            VStack{
                Spacer()
                HStack(){
                    Spacer()
                    VStack(spacing: 0){
                        Spacer()
                        
                        Text(entry.date.weekDisplayFormat)
                            .font(.title3)
                            .fontWeight(.bold)
                            .scaledToFit()
                            .minimumScaleFactor(0.3)
                            .foregroundStyle(config.weekdayTextColor)
                            .shadow(color: config.dayTextColor, radius: 1, x: 1, y: 1)
                        
                        Text(entry.date.dayDisplayFormat)
                            .font(.system(size: 60, weight: .heavy))
                            .foregroundStyle(config.dayTextColor)
                            .shadow(color: config.weekdayTextColor, radius: 1, x: 1, y: 1)
                    }
                    .padding()
                }
            }
            //  .padding()
            
        }
    }
}

@main
struct MonthlyWidget: Widget {
    let kind: String = "MonthlyWidget"
    
    var body: some WidgetConfiguration {
        //Static or Intent configuration
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            MonthlyWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Monthly Style Widget")
        .description("Shows a Monthly Theme for the date")
        .supportedFamilies([.systemSmall])
    }
}

struct MonthlyWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            Group{
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 1, day: 12)))
                    .previewContext(WidgetPreviewContext(family: .systemSmall))
               
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 2, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 3, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 4, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            }
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 5, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 6, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 7, day: 31)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 8, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 9, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 10, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 11, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 12, day: 12)))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
           
            
        }
    }
    
    
    static func dateToDisplay(month: Int, day: Int) -> Date {
        let components = DateComponents(calendar: Calendar.current,
                                        year: 2022,
                                        month: month,
                                        day: day)
        return Calendar.current.date(from: components) ?? Date.now
    }
}


extension Date {
    var weekDisplayFormat: String {
        self.formatted(.dateTime.weekday(.abbreviated))
    }
}

extension Date {
    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}
