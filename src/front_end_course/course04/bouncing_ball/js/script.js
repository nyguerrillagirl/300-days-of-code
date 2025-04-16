let canvas = document.getElementById('my_canvas');
let context = canvas.getContext('2d');

const speed = 4;
let position = 0;
let moveSpeed = speed;
let radius = 40;

function moveBall() {
    if (position + radius >= canvas.width ) {
        moveSpeed = -speed; 
    } else if (position - radius < 0) {
        moveSpeed = speed; 
    }
    position += moveSpeed;
}

function drawBall() {
    context.clearRect(0, 0, canvas.width, canvas.height);
    context.beginPath();
    context.arc(position, 50, radius, 0, Math.PI * 2, true);
    context.fill();
}

function animate() {
    moveBall();
    drawBall();
    requestAnimationFrame(animate);
}

window.requestAnimationFrame(animate);