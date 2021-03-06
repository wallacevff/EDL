bola = {}
bola_colide_vertical = false
bola_colide_horizontal = false


function bola.load()	
	bola.x = Width/2
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
	
	if(bola_colide_horizontal == false) then -- a bola muda de sentido dependendo da colisao
		bola.x = bola.x + bola.xvel * dt
	else
		bola.x = bola.x - bola.xvel * dt
	
	end
		
	-- Colisao com o player1 
	if(bola.x - bola.r <= player1.x + player1.width and (bola.y + bola.r >= player1.y and bola.y - bola.r <= player1.y + player1.height)) then -- verifica colisao com o player 1
		bola.x = bola.x+bola.r
		bola_colide_horizontal = false -- colidiu com o player 1
	end
	
	if (bola.x - bola.r < 0) then -- Verifica se a bola saiu pelo lado esquerdo
		score[4] = score[4] + 1
		bola.load()
		start = false
	end

	-- Colisao com o player 2
	if(bola.x + bola.r >= player2.x and bola.y +bola.r >= player2.y and bola.y - bola.r <= player2.y +player2.height) then -- verifica colisao com o player 2
		bola.x = bola.x - bola.r
		bola_colide_horizontal = true
	end
	
	if(bola.x +bola.r > Width) then -- verifica se a bola saiu pelo lado direito
		score[2] = score[2] + 1
		bola.load()		
		start = false
	end
	
	
	
	-- colisao com o retangulo
	o1x, o1y = o1.get() --  Adquire as posicoes do retangulo
	-- verifica colisao horizontal -- inicio -----
	if(bola.x - bola.r <= o1x + 20 and bola.x - bola.r >= o1x and bola.y + bola.r >= o1y and bola.y - bola.r <= o1y + 20 and bola_colide_horizontal == true) then
		bola.x = bola.x + bola.r
		bola_colide_horizontal = false
	end
	if (bola.x + bola.r >= o1x and  bola.x + bola.r <= o1x + 20 and bola.y + bola.r >= o1y and bola.y - bola.r <= o1y + 20 and bola_colide_horizontal == false) then
		bola.x = bola.x - bola.r
		bola_colide_horizontal = true
	end
	-- verifica colisao horizontal -- fim ---------
	
	--- verifica colisao vertical -- inicio -------
	if(bola.y - bola.r <= o1y + 20 and bola.y - bola.r >= o1y and bola.x + bola.r >= o1x and bola.x - bola.r <= o1x + 20 and bola_colide_vertical == true) then
		bola.y = bola.y + bola.r
		bola_colide_vertical = false
	end
	if (bola.y + bola.r >= o1y and  bola.y + bola.r <= o1y + 20 and bola.x + bola.r >= o1x and bola.x - bola.r <= o1x + 20 and bola_colide_vertical == false) then
		bola.x = bola.x - bola.r
		bola_colide_vertical = true
	end
	--- verifica colisao vertical --- fim ------
end






function bola.draw()
	love.graphics.circle("fill", bola.x, bola.y, bola.r)
end
