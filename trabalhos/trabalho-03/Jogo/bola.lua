bola = {}
bola_colide_vertical = false
bola_colide_horizontal = false

-- Trabalho 04
	--Nome: bola_colide_vertical
	--Propriedade: Valor
	--Biding Tine: Execução
	--Explicação: Além de ser uma variável global seu valor é sempre alterado quando a bola realiza uma colisão na parte de baixo ou de cima do campo

-- Trabalho 04
	--Nome: "/"
	--Propriedade: Semântica
	--Biding Tine: Compilação
	--Explicação: A divisão é feita em tempo de compilação do programa dependendo do tipo valores que serão calculados


function bola.load()
	bola.x = Width / 2
	bola.y = Height / 2
	bola.r = 20
	bola.speed = 500
	bola.xvel = bola.speed * math.cos(math.pi / 4)
	bola.yvel = bola.speed * math.sin(math.pi / 4)
end

function bola.update(dt)

	if (bola_colide_vertical == false) then -- Verifica se a bola colidiu na vertical
		bola.y = bola.y + bola.yvel * dt
	else
		bola.y = bola.y - bola.yvel * dt -- se ela colidiu inverta o caminho vertical
	end
	
	if(bola.y + bola.r > Height) then -- verifica se a bola bateu na parte inferior do campo
		bola.y = Height - bola.r
		bola_colide_vertical = true
	
	elseif(bola.y - bola.r < 0) then -- verifica se houve colisão novamente na vertical
		bola.y = bola.r
		bola_colide_vertical = false
	end
	
	if(bola_colide_horizontal == false) then
		bola.x = bola.x + bola.xvel * dt
	else
		bola.x = bola.x - bola.xvel * dt
	
	end

	--if(bola.x + bola.r > Width) then
	--	bola.x = Width - bola.r
	--	bola_colide_horizontal = true
	--end
	
	-- Colisao com o player1 
	if(bola.x - bola.r <= player1.x + player1.width and (bola.y + bola.r >= player1.y and bola.y - bola.r <= player1.y + player1.height)) then
		bola.x = bola.x+bola.r
		bola_colide_horizontal = false
	
	elseif (bola.x - bola.r < 0) then
		player2.score = player2.score + 1
		bola.load()
		start = false
	
	elseif(bola.x + bola.r >= player2.x and bola.y +bola.r >= player2.y and bola.y - bola.r <= player2.y +player2.height) then
		bola.x = bola.x - bola.r
		bola_colide_horizontal = true
	
	elseif(bola.x +bola.r > Width) then
		player1.score = player1.score + 1
		bola.load()
		start = false
	end
	
	
end



function bola.draw()
	love.graphics.circle("fill", bola.x, bola.y, bola.r)
end
