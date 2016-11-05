
function game_draw()
    echap()

    -- coord mouse
    mx, my = love.mouse.getPosition()
    love.graphics.print(mx, 10, 800)
    love.graphics.print(my, 10, 825)

    --player and turn
    s_player = s_player.format("%s %u", "Player", (turn + 1) % 2 + 1)
    s_turn = s_turn.format("%s %u", "Turn ", turn)
    love.graphics.print(s_turn, 800, 5)
    love.graphics.print(s_player, 800, 25)

    --mouse trigger
    pos_tab(mx, my) 

    --draw plateau
    love.graphics.draw(i_goban, 30, 50, 0, 0.3, 0.45)
    for i=1, 750, 40 do
	love.graphics.line(50, 50+i, 770, 50+i)
	love.graphics.line(50+i, 50, 50+i, 770)
    end
    for e=1,17 do
	for i=1,17 do
	    if p_goban[e][i] == 1 then
		love.graphics.draw(i_white, 70 + 40 * (i-1), 70 + 40 * (e-1), 0, 0.1, 0.1)
	    elseif p_goban[e][i] == 2 then
		love.graphics.draw(i_black, 70 + 40 * (i-1), 70 + 40 * (e-1), 0, 0.1, 0.1)
	    end
	end
    end

    if cake then
	love.graphics.print( "The cake is a lie.", 800, 200)
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
    array[9][9] = 3
    return array
end

function pos_tab(x, y)
    if love.mouse.isDown(1) then
	for i=1, 17, 1 do
	    for e=1,17 do
		if x >= 80 + 40 * (i-1) and x <= 120 + 40 * (i-1) and y >= 80 + 40 * (e-1) and y <= 120 + 40 * (e-1) then
		    arbitre(p_goban, p_goban[e][i], e, i)
		end
	    end
	end
    end
end

function prise(x, y)
    for j = -1, 1, 1 do
	for i = -1, 1, 1 do
	    p = 0
	    for c = 1, 3, 1 do
		if i ~= x and j ~= y then 
		    if c ~= 3 and p_goban[x + c * i][y + c * j] == (turn + 1) % 2 + 1 then
			p = p + 1
		    end
		    if c == 3 and p_goban[x + c * i][y + c * j] == turn % 2 + 1 then
			p = p + 1
		    end
		    if p == 3 then
			p_goban[x + i][y + j] = 3
			p_goban[x + 2 * i][y + 2 * j] = 3
		    end
		end
	    end
	end
    end
end

function align(x, y)
    print ("Player", turn % 2 + 1)
    for i = -1, 1, 1 do
	for j = -1, 1, 1 do
	    p = 0
	    for c = 1, 4, 1 do
		if i ~= 0 and j ~= 0 then 
		    if p_goban[x + c * i][y + c * j] == turn % 2 + 1 then
			print (x + c * i, y + c * j, p)
			p = p + 1
		    end
		    if p == 4 then
			print ("Player",turn % 2 + 1,"win !")
		    end
		end
	    end
	end
    end
end

function imparable()
end


function arbitre(map, pos, x, y)
    if pos == 3 then
	p_goban[x][y] = turn % 2 + 1
	for i= -1, 1, 1 do
	    for j = -1 , 1, 1 do 
		if p_goban[x+i][y+j] == 0 then
		    p_goban[x+i][y+j] = 3
		end
	    end
	end
	--check prise
	prise(x, y)
	align(x, y)
	turn = turn + 1
    end
end
