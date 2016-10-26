
function game_draw()
    echap()
    -- coord mouse
    mx, my = love.mouse.getPosition()
    love.graphics.print(mx, 10, 5)
    love.graphics.print(my, 10, 25)
    s_player = s_player.format("%s %u", "Player", turn % 2 + 1)
    s_turn = s_turn.format("%s %u", "Turn ", turn)
    love.graphics.print(s_turn, 800, 5)
    love.graphics.print(s_player, 800, 25)
    pos_tab(mx, my) 
    --draw plateau
    for i=1, 750, 40 do
	love.graphics.line(50, 50+i, 770, 50+i)
	love.graphics.line(50+i, 50, 50+i, 770)
    end
    for e=1,17 do
	for i=1,17 do
	    if p_goban[e][i] == 1 then
		love.graphics.draw(s_white, 70 + 40 * (i-1), 70 + 40 * (e-1), 0, 0.1, 0.1)
	    else if p_goban[e][i] == 2 then
		love.graphics.draw(s_black, 70 + 40 * (i-1), 70 + 40 * (e-1), 0, 0.1, 0.1)
	    end
	end
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
		if x >= 80 + 40 * (i-1) and x <= 120 + 40 * (i-1) and y >= 80 + 40 * (e-1) and y <= 120 + 40 * (e-1) then
		    if arbitre(p_goban, p_goban[e][i]) == 1 then
			p_goban[e][i] = turn % 2 + 1
			turn = turn + 1
		    end
		end
	    end
	end
    end
end

function arbitre(map, pos)
    if pos == 0 then
	return 1
    end
    return 0
end
