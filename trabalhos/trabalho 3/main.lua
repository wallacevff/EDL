require("player1")
require("player2")
require("bola")
require("controle_colisoes")
start = false

function love.load()
	player1.load()
	
	bola.load()
	
	player2.load()
end

function love.update(dt)
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
	player1.draw()
	player2.draw()
	bola.draw()
	love.graphics.print("Score player1: " .. player1.score,160,16)
	love.graphics.print("Score player2: " .. player2.score,700,16)
end
