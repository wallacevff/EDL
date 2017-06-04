Width = love.graphics.getWidth()
Height = love.graphics.getHeight()


function colide_wall(objeto)
	if(objeto.y < 0) then
		objeto.y = 0
	end
	if(objeto.y  > Height - objeto.height) then
		objeto.y = Height - objeto.height
	end
	if(objeto.x > Width - objeto.width) then
		objeto.x = Width - objeto.width	
	end
	if(objeto.x < 0) then
		objeto.x = 0 
    end
	
end

