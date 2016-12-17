Arbeit = {}
Arbeit.__index = Arbeit

function Arbeit.Prise(map, x, y, _turn)
    prise = 0
    for j = -1, 1, 1 do
	for i = -1, 1, 1 do
	    p = 0
	    for c = 1, 3, 1 do
		if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then
		    if i ~= x and j ~= y then
			if c ~= 3 and map[x + c * i][y + c * j] == (_turn + 1) % 2 + 1 then
			    p = p + 1
			end
			if c == 3 and map[x + c * i][y + c * j] == _turn % 2 + 1 then
			    p = p + 1
			end
			if p == 3 then
			    prise = prise + 1
			end
		    end
		end
	    end
	end
    end
    if prise > 0 then
	return 1, prise
    end
    return 0, 0
end

function Arbeit.Align(map, x, y, _turn)
    for j = -1, 1, 1 do
	for i = -1, 1, 1 do
	    --cas "xxxx "
	    p = 0
	    for c = 1, 4, 1 do
		if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then
		    if not (i == 0 and j == 0) then
			if map[x + c * i][y + c * j] == _turn % 2 + 1 then
			    p = p + 1
			end
			if p == 4 then
			    return 2
			end
		    end
		end
	    end
	    --cas "x xxx"
	    p = 0
	    for c = -1, 3, 1 do
		if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then
		    if not (i == 0 and j == 0) then
			if map[x + c * i][y + c * j] == _turn % 2 + 1 then
			    p = p + 1
			end
			if p == 5 then
			    return 2
			end
		    end
		end
	    end
	    --cas "xx xx"
	    p = 0
	    for c = -2, 2, 1 do
		if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then
		    if not (i == 0 and j == 0) then
			if map[x + c * i][y + c * j] == _turn % 2 + 1 then
			    p = p + 1
			end
			if p == 5 then
			    return 2
			end
		    end
		end
	    end
	end
    end
    return 0
end

function Arbeit.Result(map, x, y, _turn)
    local p, n = Arbeit.Prise(map, x, y, _turn)
    local a = Arbeit.Align(map, x, y, _turn)
    return a, p, n
end
