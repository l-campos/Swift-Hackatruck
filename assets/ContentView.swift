import SwiftUI

struct ContentView: View {
    @State public var tempo: String = "0"
    @State public var dist: String = "0"
    @State public var fundo: String = "Fundo"
    @State public var imagem: String = "questao"
    @State public var velocidade: String = "0,00 km/h"
    
    struct Caixa: GroupBoxStyle{
        func makeBody(configuration: Configuration) -> some View {
            VStack(alignment: .leading) {
                configuration.label
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.bottom, 2)
                configuration.content
            }
            .padding()
            .background(Color.black)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.5), radius: 5)
        }
    }
    var body: some View {
        VStack(spacing: 40) {
            ZStack{
                getBackgroundColor()
                    .ignoresSafeArea()
            }
                VStack{
                    Text("Digite a distância (km):")
                    TextField("", text: $dist)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("Digite o tempo (h):")
                    TextField("", text: $tempo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .multilineTextAlignment(.center)
                        .padding()
                    Button {
                        getResult()
                    } label: {
                        Text("Calcular")
                            .font(.headline)
                            .foregroundStyle(.orange)
                            .padding(.vertical, 12)
                            .padding(.horizontal, 25)
                            .background(Color.black)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 0))
                    }
                    Spacer()
                    Text("\(velocidade)").font(.title)
                    getImage()
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white,lineWidth:2))
                        .shadow(radius: 5)
                }
                GroupBox{
                    VStack{
                        HStack{
                            Text("TARTARUGA")
                            Spacer()
                            Text("0 - 9.9km/h")
                            Circle()
                                .fill(Color(.green))
                                .frame(width: 20, height: 20)
                        }
                        HStack{
                            Text("ELEFANTE")
                            Spacer()
                            Text("10 - 29.9km/h")
                            Circle()
                                .fill(Color(.blue))
                                .frame(width: 20, height: 20)
                            
                        }
                        HStack{
                            Text("AVESTRUZ")
                            Spacer()
                            Text("30 - 69.9km/h")
                            Circle()
                                .fill(Color(.yellow))
                                .frame(width: 20, height: 20)
                            
                        }
                        HStack{
                            Text("LEAO")
                            Spacer()
                            Text("70 - 89.9km/h")
                            Circle()
                                .fill(Color(.indigo))
                                .frame(width: 20, height: 20)
                            
                        }
                        HStack{
                            Text("GUEPARDO")
                            Spacer()
                            Text("90 - 130km/h")
                            Circle()
                                .fill(Color(.pink))
                                .frame(width: 20, height: 20)
                            
                        }
                    }
                    .foregroundColor(.white)
                    .padding(5)
                    
                }
                .groupBoxStyle(Caixa())
                .padding(.horizontal)
            }
            .padding()
            .background(Color(getBackgroundColor()))
            .ignoresSafeArea()
        }
    
    func getBackgroundColor() -> Color {
        return Color("\(fundo)")
    }
    
    func getImage() -> Image {
        return Image("\(imagem)")
    }
    
    private func getResult(){
        let distan = Double(dist) ?? 0.0
        let temp = Double(tempo) ?? 0.0
        let velocity = distan / temp
        self.velocidade = String(format: "%.2f km/h", velocity)
        atualizarVisualComBaseNaVelocidade(velocity)
    }
    
    private func atualizarVisualComBaseNaVelocidade(_ velocidade: Double) {
        switch velocidade {
        case 0..<10:
            fundo = "tartaruga"
            imagem = "tartaruga"
        case 10..<30:
            fundo = "elefante"
            imagem = "elefante"
        case 30..<70:
            fundo = "avestruz"
            imagem = "avestruz"
        case 70..<90:
            fundo = "leao"
            imagem = "leao"
        case 90...130:
            fundo = "guepardo"
            imagem = "guepardo"
        default:
            fundo = "cinzaFundo"
            imagem = "questao"
        }
    }
}

#Preview {
    ContentView()
}
