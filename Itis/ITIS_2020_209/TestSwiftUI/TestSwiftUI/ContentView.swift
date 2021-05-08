//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Teacher on 04.05.2021.
//

import SwiftUI

// Текст; Логин; Кнопка

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @ObservedObject var alertHider: AlertHider = AlertHider()

    init(username: String = "") {
//        self.username = username
    }

    var body: some View {
        VStack {
            Text("Please enter your name")
                .bold()
                .font(.title)

            LoginTextField(placeholder: "Your name", text: $username)
            LoginTextField(placeholder: "Password", text: $password)

            Button("Log in") {
                alertHider.start()
            }
            .alert(isPresented: $alertHider.showAlert) {
                Alert(
                    title: Text("Hello, \(username). This alert will be closed in \(alertHider.timeToClose) seconds"),
                    message: nil,
                    dismissButton: .cancel(Text("OK"), action: { self.alertHider.stop() })
                )
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
//            ContentView(username: "Amir")
        }
        .previewLayout(.fixed(width: 400, height: 400))
//        .preferredColorScheme(.dark)
    }
}

struct LoginTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Capsule().stroke())
            .background(Color.gray.opacity(0.1))
            .clipShape(Capsule())
    }
}
