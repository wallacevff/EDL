require("player1")
require("player2")
require("bola")
require("controle_colisoes")
require("center_bar")
start = false
score_left = false

--Tarefa: 6
	--Exemplo de Tupla em Lua (Score)
score = {"Score Player 1:   ", 0, "Score Player 2:   ", 0}

function love.load()
	player1.load()
	--center_bar_load()
	bola.load()
	--table.insert(center_bar_collection, center_bar)
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
	if(center_bar_collection[1] and center_bar_collection[1].hit == 3) then
		center_bar_update()
		center_bar_load()
	end
		
end

function love.draw()
	player1.draw()
	player2.draw()
	bola.draw()
	center_bar_draw()
	love.graphics.print(score[1] .. score[2],160,16)
	love.graphics.print(score[3] .. score[4],700,16)
end
