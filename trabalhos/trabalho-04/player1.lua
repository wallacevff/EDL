player1 = {}

function player1.load()
	player1.width = 20
	player1.height = 100
	player1.x = 0
	player1.y = 0
	player1.speed = 600
end


function player1.update(dt)	
	if love.keyboard.isDown("s") then
		player1.y = player1.y + (player1.speed * dt)
	elseif love.keyboard.isDown("w") then
		player1.y = player1.y - (player1.speed * dt)
	end
	
	
end

function player1.draw()
	love.graphics.rectangle("fill", player1.x, player1.y, player1.width, player1.height)
end
