Arbitre = {}
Arbitre.__index = Arbitre

Arbitre.field = nil
Arbitre.turn = 0
function Arbitre.SetTurn(self, _turn, _field)
    turn = _turn
    field = _field
end

function Arbitre.Prise(self, x, y)
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
			end
		    end
		end
	    end
	end
    end
end

function Arbitre.Align(self, x, y)
    print ("Player", turn % 2 + 1)
    for i = -1, 1, 1 do
	for j = -1, 1, 1 do
	    p = 0
	    for c = 1, 4, 1 do
		if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then 
		    if i ~= 0 and j ~= 0 then 
			if self.field[x + c * i][y + c * j] == turn % 2 + 1 then
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
end

function Arbitre.Imparable(self, x, y)
    if self.field[x][y] == 3 then
	for i = -1, 1, 1 do
	    for j = -1, 1, 1 do
		p = 0
		for c = 1, 4, 1 do
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
	for i = -1, 1, 1 do
	    for j = -1, 1, 1 do
		p = 0
		for c = 1, 5, 1 do
		    if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then 
			if i ~= x and j ~= y then 
			    if (c ~= 3 or c ~= 5) and self.field[x + c * i][y + c * j] == turn % 2 + 1 then
				p = p + 1
			    end
			    if (c == 3 or c == 5) and self.field[x + c * i][y + c * j] == 3 then
				p = p + 1
			    end
			    if p == 5 then
				return "imparable"
			    end
			end
		    end
		end
	    end
	end
    end
    return "k"
end


