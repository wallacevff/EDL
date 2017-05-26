Width = love.graphics.getWidth()
Height = love.graphics.getHeight()


function colide_wall(objeto)
	if(objeto.y < 0) then
		objeto.y = 0
	end
	
	-- Trabalho 04
	--Nome: end
	--Propriedade: Semântica
	--Biding Tine: design
	--Explicação: definida durante a implementação da linguagem. é uma palavra reservada da linguagem que determina o fim de um bloco

	-- Trabalho 04
	--Nome: objeto
	--Propriedade: endereço
	--Biding Tine: execução
	--Explicação: sendo uma variavrl local, o seu endereço é definido no momento da execução do programa e seu escopo é limitado ao bloco "colide_wall"

	
	
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

