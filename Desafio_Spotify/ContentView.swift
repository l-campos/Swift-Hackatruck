import SwiftUI

struct ContentView: View {
    struct Song: Identifiable {
        var id: Int
        var name: String
        var artista: String
        var capa: String
    }

    var arrayMusicas = [
        Song(id: 1, name: "august", artista: "Taylor Swift", capa: "folklore"),
        Song(id: 2, name: "Sweater Weather", artista: "The Neighbourhood", capa: "indie"),
        Song(id: 3, name: "Angels Like You", artista: "Miley Cyrus", capa: "peak"),
        Song(id: 4, name: "Chainsaw Blood", artista: "VAUNDY", capa: "midia"),
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color.blue.opacity(0.8), location: 0.0),
                        .init(color: Color.black, location: 0.6)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Image("imagemzada")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .clipped()
                        .padding(.top, 10)

                    HStack {
                        Text("HackaFM")
                            .foregroundStyle(.white)
                            .font(.title)
                        Spacer()
                    }
                    .padding(.horizontal)

                    HStack {
                        Image("imagemzada")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .clipped()
                        Text("HackaSong")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal)

                    VStack(spacing: 10) {
                        ScrollView(.vertical, showsIndicators: true) {
                            ForEach(arrayMusicas) { musica in
                                NavigationLink(destination: DetailView(musica: musica)) {
                                    HStack {
                                        Image(musica.capa)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 40, height: 40)
                                            .clipped()
                                            .cornerRadius(6)
                                        
                                        VStack(alignment: .leading, spacing: 2) {
                                            Text(musica.name)
                                                .foregroundStyle(.white)
                                                .font(.headline)
                                            Text(musica.artista)
                                                .foregroundStyle(.white)
                                                .font(.subheadline)
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "ellipsis")
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.horizontal)
                                }
                            }

                            ForEach(4...13, id: \.self) { i in
                                HStack {
                                    Image("preto")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .clipped()
                                        .cornerRadius(6)
                                    
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("teste \(i)")
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        Text("teste \(i)")
                                            .foregroundStyle(.white)
                                            .font(.subheadline)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "ellipsis")
                                        .foregroundStyle(.white)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .padding(.bottom)
                .frame(maxHeight: .infinity)
            }
        }
        .accentColor(.white)
        
    }
}

#Preview {
    ContentView()
}
