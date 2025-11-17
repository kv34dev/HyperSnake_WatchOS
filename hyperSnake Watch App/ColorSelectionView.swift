import SwiftUI

struct ColorSelectionView: View {
    @Binding var selectedColor: Color
    @Binding var selectedSpeed: Int
    
    @State private var goToDifficulty = false
    
    let snakeColors: [(String, Color)] = [
        ("Red", Color(.sRGB, red: 1, green: 0.27, blue: 0.27)),
        ("Orange", Color(.sRGB, red: 1, green: 0.59, blue: 0.24)),
        ("Yellow", Color(.sRGB, red: 1, green: 0.88, blue: 0.31)),
        ("Green", Color(.sRGB, red: 0.22, green: 1, blue: 0.078)),
        ("Cyan", Color.cyan),
        ("Blue", Color(.sRGB, red: 0, green: 0.47, blue: 1)),
        ("Purple", Color(.sRGB, red: 0.70, green: 0.35, blue: 1)),
        ("Pink", Color(.sRGB, red: 1, green: 0.39, blue: 0.78)),
        ("White", Color(.sRGB, red: 0.94, green: 0.94, blue: 0.94))
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            
            Text("HyperSnake")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color(red: 0.93, green: 0.93, blue: 1))
                .padding(.top, 6)
            
            // Карточка цветов
            VStack(alignment: .leading, spacing: 8) {
                Text("Snake Color")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(.white)
                
                // Сетка 3×3
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(45), spacing: 6), count: 3), spacing: 10) {
                    ForEach(snakeColors, id: \.0) { name, col in
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(col)
                                .frame(width: 42, height: 42)
                            
                            if selectedColor == col {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.white, lineWidth: 3)
                                    .frame(width: 42, height: 42)
                            }
                        }
                        .onTapGesture {
                            selectedColor = col
                        }
                    }
                }
            }
            .padding(10)
            .background(Color(red: 0.12, green: 0.12, blue: 0.16))
            .cornerRadius(14)
            
            NavigationLink(destination:
                DifficultyView(selectedColor: $selectedColor,
                               selectedSpeed: $selectedSpeed),
                isActive: $goToDifficulty
            ) { EmptyView() }
            
            Button(action: {
                goToDifficulty = true
            }) {
                Text("Next")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color.blue)
        }
        .padding()
        .background(Color(red: 0.05, green: 0.05, blue: 0.07))
    }
}
