center_bar = {}
center_bar_active = false

function center_bar.activate() -- funcao que faz a barra aparecer
	center_bar_active = true
end

function center_bar.load()
	center_bar.width = 5
	center_bar.height = Height
	center_bar.x = Width/2
	center_bar.y = Height - Height
	center_bar.hit = 0 -- controle da vida util da barra, se a bola atingir a barra 3 vezes a barra some
end

function center_bar.update() -- faz a barra aparecer e sumir
	if(center_bar_active == false) then
		center_bar_active = true
		center_bar.hit = 0
	else
		center_bar_active = false
		center_bar.hit = 0
	end
end

function center_bar.draw()
	if(center_bar_active == true) then
		love.graphics.rectangle("fill", center_bar.x, center_bar.y, center_bar.width, center_bar.height)
	end
end
