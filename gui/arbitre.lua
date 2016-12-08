Arbitre = {}
Arbitre.__index = Arbitre

Arbitre.field = {}
Arbitre.turn = 0
function Arbitre.create(_turn, _field)
    local arb = {}
    setmetatable(arb, Arbitre)
    arb.turn = _turn
    arb.field = _field
    return arb
end

function Arbitre.Prise(self, x, y)
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
			    self.field[x + i][y + j] = 3
			    self.field[x + 2 * i][y + 2 * j] = 3
			    prise = true
			end
		    end
		end
	    end
	end
    end
    if prise then
	return "prise"
    end
    return "nil"
end

function Arbitre.Align(self, x, y)
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
			    return "win"
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
			    return "win"
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
			    return "win"
			end
		    end
		end
	    end
	end
    end
    return "nil"
end

function Arbitre.Imparable(self, x, y)
    if self.field[x][y] == 3 then
	for i = -1, 1, 1 do
	    for j = -1, 1, 1 do
		--pattern " x xx " 
		--cas " 'xx x "
		p = 0
		for c = -1, 4, 1 do
		    if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then 
			if i ~= x and j ~= y then
			    if (c == -1 or c == 1 or c == 4) and self.field[x + c * i][y + c * j] == 3 then
				p = p + 1
			    end
			    if (c == 0 or c == 2 or c == 3) and self.field[x + c * i][y + c * j] == turn % 2 + 1 then
				p = p + 1
			    end
			    if p == 6 then
				return "imparable"
			    end
			end
		    end
		end
		--cas " x'x x "
		p = 0
		for c = -2, 3, 1 do
		    if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then 
			if i ~= x and j ~= y then
			    if c ~= 4 and self.field[x + c * i][y + c * j] == turn % 2 + 1 then
				p = p + 1
			    end
			    if c == 4 and self.field[x + c * i][y + c * j] == 3 then
				p = p + 1
			    end
			    if p == 4 then
				return "imparable"
			    end
			end
		    end
		end
		--cas " 'x xx "
		p = 0
		for c = -1, 4, 3 do
		    if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then 
			if i ~= x and j ~= y then
			    if c ~= 4 and self.field[x + c * i][y + c * j] == turn % 2 + 1 then
				p = p + 1
			    end
			    if c == 4 and self.field[x + c * i][y + c * j] == 3 then
				p = p + 1
			    end
			    if p == 4 then
				return "imparable"
			    end
			end
		    end
		end
		--pattern " xxx "
		--cas " 'xxx "
		p = 0
		for c = -1, 3, 1 do
		    if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then 
			if i ~= x and j ~= y then
			    if c ~= 4 and self.field[x + c * i][y + c * j] == turn % 2 + 1 then
				p = p + 1
			    end
			    if c == 4 and self.field[x + c * i][y + c * j] == 3 then
				p = p + 1
			    end
			    if p == 4 then
				return "imparable"
			    end
			end
		    end
		end
		--cas " x'xx "
		p = 0
		for c = -2, 2, 1 do 
		    if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then 
			if i ~= x and j ~= y then
			    if c ~= 4 and self.field[x + c * i][y + c * j] == turn % 2 + 1 then
				p = p + 1
			    end
			    if c == 4 and self.field[x + c * i][y + c * j] == 3 then
				p = p + 1
			    end
			    if p == 4 then
				return "imparable"
			    end
			end
		    end
		end
	    end
	end
    end
    return "nil"
end


