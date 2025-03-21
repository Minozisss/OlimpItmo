//
//  AuthView.swift
//  NewsITMO
//
//  Created by Максим Кудрявцев on 21.03.2025.
//

import SwiftUI

struct AuthView: View {
    // MARK: - Properties
    @State var vm = AuthViewModel()
    @Binding var path: NavigationPath
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            Text("Авторизация")
                .font(.title)
                .padding()
            
            TextField("Введите имя", text: $vm.user)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.background)
                .clipShape(.rect(cornerRadius: 10))
                .padding()
                .onSubmit {

                }
            
            TextField("Введите пароль", text: $vm.pass)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.background)
                .clipShape(.rect(cornerRadius: 10))
                .padding()
                .onSubmit {

                }
            
            NavigationLink(value: Pages.main) {
                Text("Войти")
                    .foregroundStyle(.background)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(.green)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding(.horizontal, 20)
            }
            
            

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(.secondary.opacity(0.2))
    }
}

//#Preview {
//    AuthView()
//}
