right = true
up = false
down =  false

---- Tarefa 08 -------
--- Exemplo de closures e coroutines --------- inicio
function new (x,y,vx) 
    local me; me = {
        move = function (dx,dy)
				x = x + dx
				y = y + dy
			return x, y
        end,
        get = function ()
             return x, y
        end,
        co = coroutine.create(function (dt)
            while true do
				for i = 0, 500 do
					me.move( vx*dt, 0)
					dt = coroutine.yield()
				end
				
				for i = 0, 500 do
					me.move( 0, -vx*dt)
					dt = coroutine.yield()
				end
				
				for i = 0, 500 do
					me.move( -vx*dt, 0)
					dt = coroutine.yield()
				end
				
				for i = 0, 500 do
					me.move( 0, vx*dt)
					dt = coroutine.yield()
				end
	
            end
        end),
    }
    return me
end
--------- fim exemplo closures ------

o1 = new(Width/2 -100,Height/2 +60,200 )

function ret_update (dt)
    coroutine.resume(o1.co, dt)
end
---- fim exemplo coroutines -----------


function ret_draw ()
    local x,y = o1.get()
    love.graphics.rectangle('fill', x,y, 20,20)
end
