import SwiftUI

struct SnakeGameView: View {
    @StateObject var game = SnakeGameModel()

    let cellSize: CGFloat = 18

    var body: some View {
        VStack {
            if game.isGameOver {
                Text("Game Over")
                    .font(.headline)
                Button("Try again") {
                    game.startGame()
                }
                .padding(.top, 8)
            } else {
                grid
                controls
            }
        }
    }

    // поле
    var grid: some View {
        VStack(spacing: 2) {
            ForEach(0..<game.size, id: \.self) { y in
                HStack(spacing: 2) {
                    ForEach(0..<game.size, id: \.self) { x in
                        let pos = Position(x: x, y: y)

                        Rectangle()
                            .foregroundColor(
                                game.snake.contains(pos) ? .green :
                                (pos == game.food ? .red : .gray.opacity(0.3))
                            )
                            .frame(width: cellSize, height: cellSize)
                            .cornerRadius(3)
                    }
                }
            }
        }.padding(4)
    }

    // кнопки управления
    var controls: some View {
        VStack {
            Button("▲") { game.changeDirection(.up) }
            HStack {
                Button("◀︎") { game.changeDirection(.left) }
                Button("▶︎") { game.changeDirection(.right) }
            }
            Button("▼") { game.changeDirection(.down) }
        }
        .font(.title2)
        .padding(.top, 4)
    }
}
