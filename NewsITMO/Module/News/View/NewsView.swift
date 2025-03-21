
import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    // MARK: - Properties
    @State var vm = NewsViewModel()
    @Binding var path: NavigationPath
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                TextField("Введите заголовок новости", text: $vm.promt)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(.background)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding()
                    .onSubmit {
                        vm.scrollIndicator = true
                        vm.searchNews()
                        vm.promt = ""
                    }
                    
                // Индикатор загрузки новостей
                if vm.scrollIndicator {
                    VStack {
                        Text("Загрузка...")
                            .titleText()
                        
                        ProgressView()
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                }
                
                
                Text("News")
                    .font(.title)
                    .fontWeight(.black)
                    .padding(20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(vm.news, id: \.url) { article in
                            NavigationLink(value: Pages.article(article)) {
                                OneNews(article: article)
                            }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    
                }
            }
        }
        
        .buttonStyle(.plain)
        .background(.secondary.opacity(0.2))
        .alert("Ошибка",
               isPresented: $vm.showError,
               actions: {
            Button {
                self.vm.showError = false
            } label: {
                Text("Ok")
            }

        },
               message: {
            switch vm.error {
            case .invalidDecoding:
                Text("Проблема декодирования, напишите в тех. поддержку m@mail.ru")
            case .invalidResponse:
                Text("Проблема запроса, напишите в тех. поддержку m@mail.ru")
            case .noData:
                Text("Отсутствие данных, напишите в тех. поддержку m@mail.ru")
            case .noInternet:
                Text("Проверьте ваше интернет соединение")
            case .none:
                Text("Неизвестная ошибка, напишите в тех. поддержку m@mail.ru")
            }
        })

        .refreshable {
            vm.fetchNews()
        }
        
    }
}

//#Preview {
//    NewsView()
//}
