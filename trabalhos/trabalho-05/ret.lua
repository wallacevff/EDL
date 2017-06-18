right = true
up = false
down =  false

---- Tarefa 08 -------
--- Exemplo de closures e coroutines --------- inicio
function new (x,y,vx) 
    local me; me = {
        move = function (dx,dy)
			if (x >= 600) then
				up = true
				right = false
			end
			
			if( right == true and up == false and down == false) then
				x = x + dx -- move para a direita
				if ( x >= 600) then
					up = true
					rigth = false
				end
			end
			
			if (up == true and right == false) then
				y = y - dy -- move para cima
				if (y <= 100) then
					up = false
				end
			end
			
			if(up == false and right == false) then
				x = x - dx -- move para a direita
				if (x <= 300) then
					right = true
					up = false
					down = true
				end
			end
				
			if ( right == true and up == false and down == true) then
				y = y + dy
				if (y >= 400) then
					down = false
					right = true
				end
			end			
				
			return x, y
        end,
        get = function ()
             return x, y
        end,
        co = coroutine.create(function (dt)
            while true do
                me.move( vx*dt, vx *dt)
                dt = coroutine.yield()
            end
        end),
    }
    return me
end
--------- fim exemplo closures ------

o1 = new(Width/2 -80,Height/2 +60,1000 )

function ret_update (dt)
    coroutine.resume(o1.co, dt)
end
---- fim exemplo coroutines -----------


function ret_draw ()
    local x,y = o1.get()
    love.graphics.rectangle('fill', x,y, 20,20)
end
