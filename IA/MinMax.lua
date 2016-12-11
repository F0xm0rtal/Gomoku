l = nil

-- function init_prise_liste(x, y)
-- 	list_prise = nil
-- 	list_prise = { x1 = x + 1, y1 = y, x2 = x + 2, y2 = y, x3 = x + 3, y3 = y,
-- 	 next = list_prise }
-- 	list_prise = { x1 = x, y1 = y + 1, x2 = x, y2 = y + 2, x3 = x, y3 = y + 3,
-- 	 next = list_prise }
-- 	list_prise = { x1 = x - 1, y1 = y, x2 = x - 2, y2 = y, x3 = x - 3, y3 = y,
-- 	  next = list_prise }
-- 	list_prise = { x1 = x, y1 = y - 1, x2 = x, y2 = y - 2, x3 = x, y3 = y - 3,
-- 	   next = list_prise }
-- 	list_prise = { x1 = x + 1, y1 = y + 1, x2 = x + 2, y2 = y + 2, x3 = x + 3, y3 = y + 3,
-- 	   next = list_prise }
-- 	list_prise = { x1 = x - 1, y1 = y - 1, x2 = x - 2, y2 = y - 2, x3 = x - 3, y3 = y - 3,
-- 	   next = list_prise }
-- 	list_prise = { x1 = x + 1, y1 = y - 1, x2 = x + 2, y2 = y - 2, x3 = x + 3, y3 = y - 3,
-- 	   next = list_prise }
-- 	list_prise = { x1 = x - 1, y1 = y + 1, x2 = x - 2, y2 = y + 2, x3 = x - 3, y3 = y + 3,
-- 	   next = list_prise }

-- 	return list_prise
-- end

function list_first_lvl(x, y)
	list_first_lvl = {next = list_first_lvl, pos = {x, y}}
	for i = -1, 1, 1 do
		for e = -1, 1, 1 do
			if x + e < 18 and x + e > 0 and y + i < 18 and y + i > 0 then
				if p_goban[x + e][y + i] == 1 or p_goban[x + e][y + i] == 2 then
					list_first_lvl.x = x + e
					list_first_lvl.y = y + i
				end
			end
		end
	end
	return list_first_lvl
end

function list_secund_lvl(x, y)
	list_secund_lvl = {next = list_secund_lvl, pos = {x, y}}
	for i = -2, 1, 2 do
		for e = -2, 1, 2 do
			if x + e < 18 and x + e > 0 and y + i < 18 and y + i > 0 then
				if p_goban[x + e][y + i] == 1 or p_goban[x + e][y + i] == 2 then
					list_secund_lvl.x = x + e
					list_secund_lvl.y = y + i
				end
			end
		end
	end
	return list_secund_lvl
end

function list_third_lvl(x, y)
	list_third_lvl = {next = list_third_lvl, pos = {x, y}}
	for i = -3, 1, 3 do
		for e = -3, 1, 3 do
			if x + e < 18 and x + e > 0 and y + i < 18 and y + i > 0 then
				if p_goban[x + e][y + i] == 1 or p_goban[x + e][y + i] == 2 then
					list_third_lvl.x = x + e
					list_third_lvl.y = y + i
				end
			end
		end
	end
	return list_third_lvl
end

function prise_IA(x,y)

list_first_lvl = list_first_lvl(x, y)
list_secund_lvl = list_secund_lvl(x, y)
list_third_lvl = list_third_lvl(x, y)

if list_third_lvl ~= nil then
while list_third_lvl do
	print(list_third_lvl.x, list_third_lvl.y)
	list_third_lvl = list_third_lvl.next
end
end

if list_secund_lvl ~= nil then
while list_secund_lvl do
	print(list_secund_lvl.x, list_secund_lvl.y)
	list_secund_lvl = list_first_lvl.next
end
end

if list_first_lvl ~= nil then
while list_first_lvl do
	print(list_first_lvl.x, list_first_lvl.y)
	list_first_lvl = list_first_lvl.next
end
end

IA_tab(9, 10)

end

function reval()
	
end

function IA_tab(x, y)
	if win == false then
		return (judge(p_goban, p_goban[x][y], x, y))
	end

	return "nil"
end

--main de l'ia

function play_IA()
	strongx, strongy = bring_me_the_strongest()
	print(strongx, strongy)
	prise_IA(strongx, strongy)
	--strongx, strongy = prise_IA(strongx, strongy)

end

--historique des coups joués

function add_Histo_tab( e, i, turn)
	l = { next = l, value = { x = e, y = i, value = 1 , player = turn }}
end

--récupère la pièce à fort potentiel

function bring_me_the_strongest()
	i = 1
	while l do
		if (l.value.value >= i) then
			i = l.value.value
			posx = l.value.x
			posy = l.value.y
		end
		l = l.next
	end
	return posx, posy
end