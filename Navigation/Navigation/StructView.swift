//
//  StructView.swift
//  Navigation
//
//  Created by user226746 on 9/14/22.
//

import Foundation
import SwiftUI

struct CircleView : View{
    var colorCircle : Color
    var text : String
    var body: some View{
        ZStack{
            Circle()
                .frame(width: 150, height: 150, alignment: .center)
                .foregroundColor(colorCircle)
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}
struct NavigationText : View {
    
    var color : Color
    var text: String
    
    var body: some View{
        Text(text)
            .frame(width: 200, height: 50)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(30)
    }
}

