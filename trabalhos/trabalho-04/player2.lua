player2 = {}
function player2.load()
	player2.width = 20
	player2.height = 100
	player2.x = Width - player2.width
	player2.y = Height - player2.height
	player2.speed = 600
	player2.score = 0
end


function player2.update(dt)	
	if love.keyboard.isDown("down") then
		player2.y = player2.y + (player2.speed * dt)
	elseif love.keyboard.isDown("up") then
		player2.y = player2.y - (player2.speed * dt)
	end	
	
end

function player2.draw()
	love.graphics.rectangle("fill", player2.x, player2.y, player2.width, player2.height)
end

