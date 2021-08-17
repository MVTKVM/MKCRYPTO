//
//  PullDownView.swift
//  MK Crypto
//
//  Created by Mathieu Camélique on 14.06.21.
//

import SwiftUI

struct PullDownView: View {
    
    var coordinateSpace: CoordinateSpace
    @State var refresh: Bool = false
    
        var body: some View {
            GeometryReader { geo in
                if (geo.frame(in: coordinateSpace).midY > 50) {
                    Spacer()
                        .onAppear {
                            if refresh == false {
                                testFunction() //call refresh once if pulled more than 50px
                            }
                            refresh = true
                        }
                } else if (geo.frame(in: coordinateSpace).maxY < 1) {
                    Spacer()
                        .onAppear {
                            refresh = false
                            //reset  refresh if view shrink back
                        }
                }
                ZStack(alignment: .center) {
                    if refresh { //show loading if refresh called
                        ProgressView()
                    } else { //mimic static progress bar with filled bar to the drag percentage
                        ForEach(0..<8) { tick in
                              VStack {
                                  Rectangle()
                                    .fill(Color(UIColor.tertiaryLabel))
                                    .opacity((Int((geo.frame(in: coordinateSpace).midY)/7) < tick) ? 0 : 1)
                                      .frame(width: 3, height: 7)
                                    .cornerRadius(3)
                                  Spacer()
                          }.rotationEffect(Angle.degrees(Double(tick)/(8) * 360))
                       }.frame(width: 20, height: 20, alignment: .center)
                    }
                }.frame(width: geo.size.width)
            }.padding(.top, -50)
        }
    
    func testFunction() {
        print("oui")
    }
}
