Arbeit = {}
Arbeit.__index = Arbeit

Arbeit.field = {}
Arbeit.turn = 0
function Arbeit.create(_turn, _field)
    local arb = {}
    setmetatable(arb, Arbeit)
    arb.turn = _turn
    arb.field = _field
    return arb
end

function Arbeit.Prise(self, x, y)
    prise = false
    for j = -1, 1, 1 do
	for i = -1, 1, 1 do
	    p = 0
	    for c = 1, 3, 1 do
		if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then
		    if i ~= x and j ~= y then
			if c ~= 3 and self.field[x + c * i][y + c * j] == (turn + 1) % 2 + 1 then
			    p = p + 1
			end
			if c == 3 and self.field[x + c * i][y + c * j] == turn % 2 + 1 then
			    p = p + 1
			end
			if p == 3 then
			    --self.field[x + i][y + j] = 3
			    --self.field[x + 2 * i][y + 2 * j] = 3

			    --remove_from_list(list_historique,x + i, y + j)

			    --remove_from_list(list_historique,x + 2 * i, y + 2 * j)
			    
			    prise = true
			    --score[turn % 2 + 1] = score[turn % 2 + 1] + 2
			end
		    end
		end
	    end
	end
    end
    if prise then
	return 1
    end
    return 0
end

function Arbeit.Align(self, x, y)
    for j = -1, 1, 1 do
	for i = -1, 1, 1 do
	    --cas "xxxx "
	    p = 0
	    for c = 1, 4, 1 do
		if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then
		    if not (i == 0 and j == 0) then
			if self.field[x + c * i][y + c * j] == turn % 2 + 1 then
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
			if self.field[x + c * i][y + c * j] == turn % 2 + 1 then
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
			if self.field[x + c * i][y + c * j] == turn % 2 + 1 then
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
