
--Tarefa 06:
	--Exemplo de registro em Lua new_bar
new_bar = {
	width = 10,
	height = 50,
	x = math.random(10, Width),
	y = 0,
	speed = 1
}

			
barTime = 0.8
function new_bar_load()
	new_bar.width = 10
	new_bar.height = 50
	new_bar.x = math.random(10, Width)
	new_bar.y = 0
end

--Tarefa 06:
	--Exemplo de array em Lua bars = {}
	
-- Tarefa 07:
	-- Escopo: O array bars pode ser visualizado e modificado em qualquer parte do jogo, portanto é uma variável global
	
	-- Tempo de vida: até o fechamento do jogo, quando o jogo é aberto o array é instânciado, quando a partida inicia
		--começa a insersão de elementos,
		--sendo zerado toda vez que a tecla r é pressionada, também quando a bola bate em uma das barras ou as barras 
		--saem do campo pela parte inferior elas são desalocadas
	
	-- Alocação: a alocação é feita na função bars.update que é chamada na love.update dinamicamente conforme o tempo vai passando no jogo
	
	-- Desalocação: é realizada desalocação de elemento quando uma das barras é atingida pela bola, quando elas saem pela parte de baixo do campo
				  --ou quando a tecla r é pressionada e quando o programa é encerrado a desalocação é total
bars = {}
createBarTime = barTime

function clone (proto) -- funcão que clona a new_bar para jogar no Array
    local new = {}
    for k,v in pairs(proto) do
        new[k] = v
    end
    return new
end


flag = true
function bars.update(dt) -- cria novas instancias no Array e move as barras 
	createBarTime = createBarTime - (1 * dt)
	if createBarTime < 0 then
		createBarTime = barTime
		new_bar_load()
		table.insert(bars, clone(new_bar))	
	end
	--if flag == true then
			--flag = false
			
	--	end
	for i,bar in ipairs(bars) do
		
		bar.y = bar.y + 100*dt
		if bar.y+ bar.height >= Height then
			table.remove(bars,i)
			--flag = true
			
			

		end
	end
	
end


function bars_draw() -- Desenha as barras que estao no Array de barras
	for i,bar in ipairs(bars) do
		love.graphics.rectangle("fill", bar.x, bar.y, bar.width, bar.height)
	end

end
