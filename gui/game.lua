
function game_draw()
	echap()
	-- coord mouse
    mx, my = love.mouse.getPosition()
    love.graphics.print(mx, 10, 5)
    love.graphics.print(my, 10, 25)
  	pos_tab(mx, my) 
    --draw plateau
    for i=1, 750, 40 do
	  love.graphics.line(50, 50+i, 770, 50+i)
	  love.graphics.line(50+i, 50, 50+i, 770)
    end
	for e=1,17 do
		for i=1,17 do
	    	love.graphics.print(p_goban[e][i], 80 + 40 * (i-1), 80 + 40 * (e-1))	
    	end
	end
end

function init_aray()
	array = {}

	for i=1,17 do
   		array[i] = {}
   		for j=1,17 do
      		array[i][j] = 0
   		end
	end
	return array
end

function pos_tab(x, y)
	if love.mouse.isDown(1) then
		for i=1, 17, 1 do
			for e=1,17 do
				if x >= 90 + 40 * (i-1) and x <= 110 + 40 * (i-1) and y >= 90 + 40 * (e-1) and y <= 110 + 40 * (e-1) then
				p_goban[e][i] = 1
			end
			end
		end
	end
end

function arbitre()
	--body
end
