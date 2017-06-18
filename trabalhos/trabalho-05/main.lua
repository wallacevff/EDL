require("player1")
require("player2")
require("bola")
require("controle_colisoes")
require("ret")
start = false
score_left = false
score = {"Score Player 1:   ", 0, "Score Player 2:   ", 0}
o1x, o1y = o1.get()
function love.load()
	player1.load()
	bola.load()
	player2.load()
end

function love.update(dt)
	ret_update(dt)
	player1.update(dt)
	colide_wall(player1)
	player2.update(dt)
	colide_wall(player2)
	if(start == true) then
		bola.update(dt)
	elseif love.keyboard.isDown("space") then
		bola.update(dt)
		start = true
	end
end

function love.draw()
	ret_draw()
	player1.draw()
	player2.draw()
	bola.draw()
	love.graphics.print(score[1] .. score[2],160,16)
	love.graphics.print(score[3] .. score[4],700,16)
end
