import SwiftUI

struct GameView: View {
    let snakeColor: Color
    let speed: Int
    
    @State private var snake: [CGPoint] = [CGPoint(x: 5, y: 5)]
    @State private var food = CGPoint(x: 2, y: 2)
    @State private var dir = CGPoint(x: 1, y: 0)
    
    @State private var gameOver = false
    
    let gridSize = 12
    
    var body: some View {
        VStack {
            if gameOver {
                Text("Game Over")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.red)
                
                Button("Restart") {
                    restart()
                }
                .buttonStyle(.bordered)
            } else {
                GeometryReader { geo in
                    let cell = geo.size.width / CGFloat(gridSize)
                    
                    ZStack {
                        // Еда
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.red)
                            .frame(width: cell, height: cell)
                            .position(x: food.x * cell + cell/2,
                                      y: food.y * cell + cell/2)
                        
                        // Змейка
                        ForEach(0..<snake.count, id: \.self) { i in
                            RoundedRectangle(cornerRadius: 6)
                                .fill(snakeColor)
                                .frame(width: cell, height: cell)
                                .position(x: snake[i].x * cell + cell/2,
                                          y: snake[i].y * cell + cell/2)
                        }
                    }
                }
            }
        }
        .padding()
        //.background(Color(red: 0.12, green: 0.12, blue: 0.14))
        .gesture(
            DragGesture(minimumDistance: 10)
                .onEnded { value in
                    let dx = value.translation.width
                    let dy = value.translation.height
                    
                    if abs(dx) > abs(dy) {
                        // Горизонтальный свайп
                        if dx > 0 && dir.x == 0 { dir = CGPoint(x: 1, y: 0) }      // вправо
                        if dx < 0 && dir.x == 0 { dir = CGPoint(x: -1, y: 0) }     // влево
                    } else {
                        // Вертикальный свайп
                        if dy > 0 && dir.y == 0 { dir = CGPoint(x: 0, y: 1) }      // вниз
                        if dy < 0 && dir.y == 0 { dir = CGPoint(x: 0, y: -1) }     // вверх
                    }
                }
        )
        .onAppear { startLoop() }
    }
    
    func startLoop() {
        Timer.scheduledTimer(withTimeInterval: 1.0 / Double(speed), repeats: true) { _ in
            update()
        }
    }
    
    func update() {
        if gameOver { return }
        
        let head = snake.first!
        let new = CGPoint(x: head.x + dir.x, y: head.y + dir.y)
        
        if new.x < 0 || new.x >= CGFloat(gridSize) ||
            new.y < 0 || new.y >= CGFloat(gridSize) ||
            snake.contains(new) {
            gameOver = true
            return
        }
        
        snake.insert(new, at: 0)
        
        if new == food {
            spawnFood()
        } else {
            snake.removeLast()
        }
    }
    
    func spawnFood() {
        food = CGPoint(
            x: CGFloat(Int.random(in: 0..<gridSize)),
            y: CGFloat(Int.random(in: 0..<gridSize))
        )
    }
    
    func restart() {
        snake = [CGPoint(x: 5, y: 5)]
        dir = CGPoint(x: 1, y: 0)
        spawnFood()
        gameOver = false
    }
}
