import Foundation
import SwiftUI
import Combine

enum Direction {
    case up, down, left, right
}

struct Position: Equatable {
    var x: Int
    var y: Int
}

class SnakeGameModel: ObservableObject {
    @Published var snake: [Position] = [Position(x: 5, y: 5)]
    @Published var food = Position(x: 2, y: 2)
    @Published var direction: Direction = .right
    @Published var isGameOver = false

    let size = 10  // поле 10×10

    var timer: Timer?

    init() {
        startGame()
    }

    func startGame() {
        snake = [Position(x: 5, y: 5)]
        direction = .right
        isGameOver = false
        spawnFood()

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { _ in
            self.update()
        }
    }

    func spawnFood() {
        food = Position(x: Int.random(in: 0..<size),
                        y: Int.random(in: 0..<size))
    }

    func update() {
        guard !isGameOver else { return }

        var newHead = snake.first!

        switch direction {
        case .up:    newHead.y -= 1
        case .down:  newHead.y += 1
        case .left:  newHead.x -= 1
        case .right: newHead.x += 1
        }

        // проверка столкновений
        if newHead.x < 0 || newHead.x >= size ||
           newHead.y < 0 || newHead.y >= size ||
           snake.contains(newHead)
        {
            isGameOver = true
            timer?.invalidate()
            return
        }

        snake.insert(newHead, at: 0)

        // еда
        if newHead == food {
            spawnFood()
        } else {
            snake.removeLast()
        }
    }

    func changeDirection(_ new: Direction) {
        // запрет поворота на 180°
        if (direction == .up && new == .down) ||
            (direction == .down && new == .up) ||
            (direction == .left && new == .right) ||
            (direction == .right && new == .left) {
            return
        }
        direction = new
    }
}
