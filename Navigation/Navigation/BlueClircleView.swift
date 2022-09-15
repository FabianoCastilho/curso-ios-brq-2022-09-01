//
//  BlueClircleView.swift
//  Navigation
//
//  Created by user226746 on 9/14/22.
//

import SwiftUI

struct BlueClircleView: View {
 
    var body: some View {
        VStack{
            CircleView(colorCircle: .blue, text: "2")
//            ZStack{
//                Circle()
//                    .frame(width: 150, height: 150, alignment: .center)
//                    .foregroundColor(.blue)
//                Text("2")
//                    .foregroundColor(.white)
//                    .font(.system(size: 70, weight: .bold))
//                }
            NavigationLink(destination: GreenCircleView(), label: {
                NavigationText(color: .green, text: "Próxima Página")} )
//                Text("Página Green")})
//                .frame(width: 200, height: 50)
//                .background(.blue)
//                .foregroundColor(.white)
//                .cornerRadius(30)
            }
        
    }
}

struct BlueClircleView_Previews: PreviewProvider {
    static var previews: some View {
        BlueClircleView()
    }
}
