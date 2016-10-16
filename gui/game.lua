
function game_draw()
	echap()
    --draw plateau
    for i=1, 770, 40 do
	  love.graphics.line(50, 50+i, 810, 50+i)
	  love.graphics.line(50+i, 50, 50+i, 810)
    end
end

function init_aray()
	array = {}

	for i=1,19 do
   		array[i] = {}
   		for j=1,19 do
      		array[i][j] = 0
   		end
	end
	return array
end

function arbitre()
	--body
end