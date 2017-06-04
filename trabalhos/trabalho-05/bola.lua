bola = {}
bola_colide_vertical = false
bola_colide_horizontal = false


function bola.load()
	if(center_bar_active == false) then -- Verifica se a barra central está ativa
		bola.x = Width / 2
		bola.y = Height / 2
		bola.r = 20
		bola.speed = 500
		bola.xvel = bola.speed * math.cos(math.pi / 4)
		bola.yvel = bola.speed * math.sin(math.pi / 4)
		
	elseif(score_left == false) then -- Verifica se a bola vem ao lado direito da barra central
		bola.x = Width/2 + 5 +bola.r
		bola.y = Height / 2
		bola.r = 20
		bola.speed = 500
		bola.xvel = bola.speed * math.cos(math.pi / 4)
		bola.yvel = bola.speed * math.sin(math.pi / 4)
	
	elseif(score_left == true) then -- Verifica se a bola vem ao lado esquerdo da barra central
		bola.x = Width/2 - bola.r
		bola.y = Height / 2
		bola.r = 20
		bola.speed = 500
		bola.xvel = bola.speed * math.cos(math.pi / 4)
		bola.yvel = bola.speed * math.sin(math.pi / 4)
	
	end
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
		player2.score = player2.score + 1
		center_bar.update()
		score_left = true -- se a bola sair pelo lado direito ela vai aparecer no lado direito
		bola.load()
		start = false
	end

	-- Colisao com o player 2
	if(bola.x + bola.r >= player2.x and bola.y +bola.r >= player2.y and bola.y - bola.r <= player2.y +player2.height) then -- verifica colisao com o player 2
		bola.x = bola.x - bola.r
		bola_colide_horizontal = true
	end
	
	if(bola.x +bola.r > Width) then -- verifica se a bola saiu pelo lado direito
		player1.score = player1.score + 1
		center_bar.update()
		score_left = false -- se a bola sair pelo lado esquerdo, ela aparecera no lado esquerdo
		bola.load()		
		start = false
	end
	
	if(center_bar_active and score_left == true and start == true) then -- controle de colisao da bola com a barra central
		if(bola.x + bola.r >= Width/2) then
			bola.x = bola.x - bola.r
			bola_colide_horizontal = true
			center_bar.hit = center_bar.hit+1 -- variavel que define a vida util da barra central
		end
	end
	if(center_bar_active and score_left == false and start == true) then
		if(bola.x - bola.r <= Width/2 + 5) then
			bola.x = bola.x+bola.r
			bola_colide_horizontal = false
			center_bar.hit = center_bar.hit+1 -- variavel de determina a vida util da barra central
		end
	end	
	

	
end



function bola.draw()
	love.graphics.circle("fill", bola.x, bola.y, bola.r)
end
