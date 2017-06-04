--Tarefa 6
	-- Exemplo de registro (center_bar)



center_bar = {width = 5, 
	height = Height,
	x = Width/2,
	y = Height - Height,
	hit = 0}
	
-- Tarefa 6
    --Exemplo de array (center_bar_collection)
center_bar_collection = {}
center_bar_active = false

function center_bar.activate() -- funcao que faz a barra aparecer
	center_bar_active = true
end

function center_bar_load()
	center_bar.width = 5
	center_bar.height = Height
	center_bar.x = Width/2
	center_bar.y = Height - Height
	center_bar.hit = 0 -- controle da vida util da barra, se a bola atingir a barra 3 vezes a barra some
end

function center_bar_update() -- faz a barra aparecer e sumir
	--Tarefa 7
		-- Alocacao:
		-- Neste momento a barra central é alocada
		-- A alocacao ocorre quando a bola passa pela extremidade esquerda ou direita
		
	if(center_bar_active == false) then
		center_bar_active = true
		table.insert(center_bar_collection,center_bar)
		--center_bar.hit = 0
	
	--Tarefa 7:
		-- Tempo de Vida:
		-- O tempo de vida da barra é até a pontuacao de um dos jogadores ou a bola bater nela 3 vezes
	
	-- Tarefa 7
		-- Escopo:
		-- center_bar está declarada no load do programa, logo seu escopo é global

	else
		center_bar_active = false
		table.remove(center_bar_collection,1)
	
	-- Tarefa 7
		-- Aqui a barra é desalocada ou porque a bola bateu 3 vezes nela ou porque houve a pontuacao de um dos jogadores
		
	end
end

function center_bar_draw()
	if(center_bar_collection[1] and center_bar_active == true) then
		love.graphics.rectangle("fill", center_bar_collection[1].x, center_bar_collection[1].y, center_bar_collection[1].width, center_bar_collection[1].height)
	end
end
