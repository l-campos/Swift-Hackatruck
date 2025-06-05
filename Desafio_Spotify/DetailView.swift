import SwiftUI

struct DetailView: View {
    var musica: ContentView.Song

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color.blue.opacity(0.8), location: 0.0),
                    .init(color: Color.black, location: 0.7)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()
                Image(musica.capa)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 250, height: 250)
                    .clipped()
                    .cornerRadius(16)
                    .shadow(radius: 10)

                Text(musica.name)
                    .font(.title)
                    .foregroundStyle(.white)
                    .padding(.top, 20)

                Text(musica.artista)
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.8))
                    .padding(.bottom, 40)

                HStack(spacing: 40) {
                    Image(systemName: "shuffle")
                    Image(systemName: "backward.end.fill")
                    Image(systemName: "play.fill")
                        .font(.system(size: 35))
                    Image(systemName: "forward.end.fill")
                    Image(systemName: "repeat")
                }
                .foregroundStyle(.white)
                .font(.title2)

                Spacer()
            }
            .padding()
        }
    }
}
