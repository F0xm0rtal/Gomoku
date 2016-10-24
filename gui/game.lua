
function game_draw()
	echap()
	-- coord mouse
    mx, my = love.mouse.getPosition()
    love.graphics.print(mx, 10, 5)
    love.graphics.print(my, 10, 25)
    
    --draw plateau
    for i=1, 770, 40 do
	  love.graphics.line(50, 50+i, 810, 50+i)
	  love.graphics.line(50+i, 50, 50+i, 810)
    end
	for e=1,18 do
		for i=1,18 do
	    	love.graphics.print(p_goban[e][i], 80 + 40 * (i-1), 80 + 40 * (e-1))	
    	end
	end
end

function init_aray()
	array = {}

	for i=1,18 do
   		array[i] = {}
   		for j=1,18 do
      		array[i][j] = 0
   		end
	end
	return array
end

function arbitre()
	--body
end