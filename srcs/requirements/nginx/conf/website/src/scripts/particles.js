const canvas = document.querySelector('canvas')

let mouse = {
    x: undefined,
    y: undefined,
    radius: undefined
}

const canvasOffset = findOffset(canvas)

canvas.width = window.innerWidth
canvas.height = window.innerHeight

const size = 128
mouse.radius = (canvas.height / size) * (canvas.height / size)

const c = canvas.getContext('2d')

const colorArray = [
    '#7f8c8d',
    '#16a085',
    '#bdc3c7',
]

window.addEventListener('resize', () => {
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight

    mouse.radius = (canvas.height / size) * (canvas.height / size)
})

window.addEventListener('mousemove', (e) => {
    mouse.x = e.x - canvasOffset.left
    mouse.y = e.y - canvasOffset.top / 2.0
})

const circle = Math.PI * 2

class Particle {
    constructor(x, y, velocityX, velocityY, radius) {
        this.x = x
        this.y = y
        this.velX = velocityX
        this.velY = velocityY
        this.radius = radius
        this.color = colorArray[Math.floor(Math.random() * colorArray.length)]

        this.draw = () => {
            c.beginPath()
            c.arc(this.x, this.y, this.radius, circle, false)
            c.fillStyle = this.color
            c.fill()
        }

        this.update = () => {
            if (this.x + this.radius > innerWidth || this.x - this.radius < 0)
                velocityX = -velocityX

            if (this.y + this.radius > innerHeight || this.y - this.radius < 0)
                velocityY = -velocityY

            const dx = mouse.x - this.x
            const dy = mouse.y - this.y

            const mouseDistance = Math.sqrt(dx * dx + dy * dy)

            if (mouseDistance < mouse.radius + this.radius) {
                if (mouse.x < this.x && this.x < canvas.width - this.radius * 10) {
                    this.x += 10
                }

                if (mouse.x > this.x && this.x > this.radius * 10) {
                    this.x -= 10
                }

                if (mouse.y < this.y && this.y < canvas.height - this.radius * 10) {
                    this.y += 10
                }

                if (mouse.y > this.y && this.y > this.height * 10) {
                    this.y -= 10
                }
            }

            this.x += velocityX
            this.y += velocityY

            this.draw()
        }
    }
}

const particleAmount = 500
let particleArray = []

function init() {
    particleArray = []

    for (let i = 0; i < particleAmount; i++) {
        const radius = Math.random() * 6 + 1

        const x = Math.random() * (innerWidth)
        const y = Math.random() * (innerHeight)

        const startVelX = (Math.random() - 0.25)
        const startVelY = (Math.random() - 0.25)

        particleArray.push(new Particle(x, y, startVelX, startVelY, radius))
    }
}

function animate() {
    requestAnimationFrame(animate)

    c.clearRect(0, 0, innerWidth, innerHeight)

    // c.beginPath()
    // c.arc(mouse.x, mouse.y, mouse.radius, Math.PI * 2, false)
    // c.fillStyle = "#FFFFFF"
    // c.fill()

    for (let i = 0; i < particleArray.length; i++) {
        const p1 = particleArray[i]

        for (let j = i + 1; j < particleArray.length; j++) {
            const p2 = particleArray[j]

            const dx = p1.x - p2.x
            const dy = p1.y - p2.y

            const distance = Math.sqrt((dx * dx) + (dy * dy))

            const size = 64

            if (distance < size) {
                c.strokeStyle = "rgba(255, 255, 255, 0.5)"
                c.lineWidth = 1
                c.beginPath()
                c.moveTo(p1.x, p1.y)
                c.lineTo(p2.x, p2.y)
                c.stroke()
            }
        }
    }

    for (let i = 0; i < particleArray.length; i++)
        particleArray[i].update()
}

animate()
init()