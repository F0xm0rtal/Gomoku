
function game_draw()
    
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
	love.graphics.print( "The cake is a lie.", 810, 200)
    end

    if win then
	s_win = s_win.format("%s %u %s","Player", (turn % 2 + 1), "win !")
	love.graphics.print(s_win, 810, 300)
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
		    if win == false then
			judge(p_goban, p_goban[e][i], e, i)
		    end
		end
	    end
	end
    end
end

function judge(map, pos, x, y)
    impa = 0
    arb = Arbitre.create(turn, map)
    if pos == 3 then
	p_goban[x][y] = turn % 2 + 1
	for i= -1, 1, 1 do
	    for j = -1 , 1, 1 do 
		if x + i < 18 and x + i > 0 and y + j < 18 and y + j > 0 then 
		    if p_goban[x+i][y+j] == 0 then
			p_goban[x+i][y+j] = 3
		    end
		end
	    end
	end

	--check impa
	for i = 1, 17, 1 do
	    for j = 1, 17, 1 do
		if arb:Imparable(x,y) == "imparable" then
		    print ("imparable")
		    impa = 1
		end
	    end
	end
	if impa == 0 then
	    arb:Prise(x, y)
	    if arb:Align(x, y) == "win" then
		win = true
	    end
	    turn = turn + 1
	else
	    love.graphics.print("Imparable !\nMouvement\ninterdit !", 810, 500)
	    p_goban[x][y] = 3
	end
    end
end
