//
//  SquareView.swift
//  Tic Tac Toe
//
//  Created by Austin Alan Stockslager (Student) on 4/19/22.
//

import Foundation
import SwiftUI
//creates the statuses for each square
enum SquareStatus {
    case empty
    case home
    case visitor
}

class Square : ObservableObject {
    @Published var squareStatus : SquareStatus
    //sets the status for a filled square
    init(status : SquareStatus) {
        self.squareStatus = status
    }
}
//creates the Xs for the player and the Os for the AI
struct SquareView : View {
    @ObservedObject var dataSource : Square
    var action: () -> Void
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(self.dataSource.squareStatus == .home ?
                    "X" : self.dataSource.squareStatus == .visitor ? "0" : " ")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
                .frame(width: 70, height: 70, alignment: .center)
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .padding(4)
        })
    }
}

