//
//  Notification.swift
//  喝水助手
//
//  Created by Monica Qiu on 2021-03-25.
//

import SwiftUI

struct Notification: View {
    
    var alarms = [Alarm(hour: 5, minute: 2), Alarm(hour: 5, minute: 20), Alarm(hour: 5, minute: 6)]
//        [Alarm]()
    
    var body: some View {
        
        VStack {
            
            // if there are no alarms
            if alarms.count == 0 {
                Text("Set a drink alarm!")
                    .foregroundColor(Color.black.opacity(0.5))
                
            } else {
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8) {
                        ForEach(self.alarms){i in
                            
                            alarmCell(alarm: i)
                        }
                    }
                }
                
            }
            
        }
        
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}

struct alarmCell: View {
    
    var alarm: Alarm
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) { // doesn't work
                    
                    HStack {
                        
                        // maybe enlargen the text and the image
                        
                        Text(String(format: "%02d:%02d", alarm.hour, alarm.minute))
                        Spacer()
                        Image(systemName: "trash")
                            .foregroundColor(.pink)
                        
                        
                        
                    }.padding(.horizontal, 40)
                    .padding(.vertical, 20)
            }
        
            }.padding()
        
    }
    
}
