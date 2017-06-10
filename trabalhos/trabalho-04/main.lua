require("player1")
require("player2")
require("bola")
require("controle_colisoes")
require("bars")
start = false
--Tarefa: 6
	--Exemplo de Tupla em Lua (Score)
score = {"Score Player 1:   ", 0, "Score Player 2:   ", 0}

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
--Tarefa 06
	--Exemplo de enumeração em Lua
	if love.keyboard.isDown("r") then  -- deleta todos os itens do array bars
		start = false
		player1.load()
		bola.load()
		player2.load()
		score[2] = 0
		score[4] = 0
		for bar,i in ipairs(bars) do
			table.remove(bars,bar)
		end
	end
	-------------------------------
	if(start == true) then
		bola.update(dt)
		bars.update(dt)
	elseif love.keyboard.isDown("space") then
		bola.update(dt)
		start = true
	end
		
end

function love.draw()
	player1.draw()
	player2.draw()
	bola.draw()
	love.graphics.print(score[1] .. score[2],160,16)
	love.graphics.print(score[3] .. score[4],700,16)
	bars_draw()
end
