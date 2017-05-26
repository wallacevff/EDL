player1 = {}

function player1.load()
	player1.width = 20
	player1.height = 100
	player1.x = 0
	player1.y = 0
	player1.speed = 600
	player1.score = 0
end


function player1.update(dt)
	--if love.keyboard.isDown("a") then
	--	player1.x = player1.x - (player1.speed * dt)		
	--elseif love.keyboard.isDown("d") then
	--	player1.x = player1.x +(player1.speed * dt)
	--end
	
	if love.keyboard.isDown("s") then
		player1.y = player1.y + (player1.speed * dt)
		
	-- Trabalho 04
	--Nome: player1.y
	--Propriedade: Valor
	--Biding Tine: execução
	--Explicação: Seu valor é alterado em tempo de execução toda vez que o player se move na tela

	elseif love.keyboard.isDown("w") then
		player1.y = player1.y - (player1.speed * dt)
	end
	
	
end

function player1.draw()
	love.graphics.rectangle("fill", player1.x, player1.y, player1.width, player1.height)
end
