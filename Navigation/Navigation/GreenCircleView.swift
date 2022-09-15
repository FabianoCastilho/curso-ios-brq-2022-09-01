//
//  GreenCircleView.swift
//  Navigation
//
//  Created by user226746 on 9/14/22.
//

import SwiftUI

struct GreenCircleView: View {
    var body: some View {
        CircleView( colorCircle: .green,text: "3")
//            Circle()
//                .frame(width: 150, height: 150, alignment: .center)
//                .foregroundColor(.green)
//            Text("3")
//                .foregroundColor(.white)
//                .font(.system(size: 70, weight: .bold))
//        }
    }
}

struct GreenCircleView_Previews: PreviewProvider {
    static var previews: some View {
        GreenCircleView()
    }
}
