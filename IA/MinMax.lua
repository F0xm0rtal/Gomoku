function init_prise_liste(x, y)
	list_prise = nil
	list_prise = { x1 = x + 1, y1 = y, x2 = x + 2, y2 = y, x3 = x + 3, y3 = y,
	 next = list_prise }
	list_prise = { x1 = x, y1 = y + 1, x2 = x, y2 = y + 2, x3 = x, y3 = y + 3,
	 next = list_prise }
	list_prise = { x1 = x - 1, y1 = y, x2 = x - 2, y2 = y, x3 = x - 3, y3 = y,
	  next = list_prise }
	list_prise = { x1 = x, y1 = y - 1, x2 = x, y2 = y - 2, x3 = x, y3 = y - 3,
	   next = list_prise }
	list_prise = { x1 = x + 1, y1 = y + 1, x2 = x + 2, y2 = y + 2, x3 = x + 3, y3 = y + 3,
	   next = list_prise }
	list_prise = { x1 = x - 1, y1 = y - 1, x2 = x - 2, y2 = y - 2, x3 = x - 3, y3 = y - 3,
	   next = list_prise }
	list_prise = { x1 = x + 1, y1 = y - 1, x2 = x + 2, y2 = y - 2, x3 = x + 3, y3 = y - 3,
	   next = list_prise }
	list_prise = { x1 = x - 1, y1 = y + 1, x2 = x - 2, y2 = y + 2, x3 = x - 3, y3 = y + 3,
	   next = list_prise }

	return list_prise
end

function prise_IA(x,y)

	list_prise = init_prise_liste(x,y)
	return_list = nil
	while list_prise do

		if list_prise.x1 < 18 and list_prise.y1 < 18 and list_prise.x1 > 0  and list_prise.y1 > 0 and list_prise.x2 < 18 and list_prise.y2 < 18 and list_prise.x2 > 0 and list_prise.y2 > 0 then

			if p_goban[list_prise.x1][list_prise.y1] == 2 and p_goban[list_prise.x2][list_prise.y2] == 2 then
				if  list_prise.x3 < 18 and list_prise.y3 < 18 and list_prise.x3 > 0 and list_prise.y3 > 0  and p_goban[list_prise.x3][list_prise.y3] == 3 then
					print("prise", list_prise.x3, list_prise.y3)
					return_list = {x = list_prise.x3, y = list_prise.y3 , next = return_list }
				end
			end
		end
		list_prise = list_prise.next
	end
	return return_list
end

function IA_tab(x, y)
	if win == false then
		return (judge(p_goban, p_goban[x][y], x, y))
	end

	return "nil"
end

--main de l'ia

function play_IA()
	played = 666
	for i=1, 17, 1 do
		for e=1, 17, 1 do
      		if p_goban[e][i] == 1 then
      			print(e,i)
      			list = prise_IA(e, i)
      			if list ~= nil then
      				IA_tab(list.x, list.y)
      				played = 1
      				break
      			end
      		end
      		-- if p_goban[e][i] == 3 then
      		-- 	IA_tab(e, i)
      		-- end
    	end
  	end
  	if played ~= 1 then

  		if p_goban[12][10] == 1 or p_goban[12][10] == 2 then
  			IA_tab(13, 10)
  		end
  		if p_goban[11][10] == 1 or p_goban[11][10] == 2 then
  			IA_tab(12, 10)
  		end
  		if p_goban[10][10] == 1 or p_goban[10][10] == 2 then
  			IA_tab(11, 10)
  		end
  		if p_goban[9][10] == 1 or p_goban[9][10] == 2 then
  			IA_tab(10, 10)
  		end
  		IA_tab(9, 10)
  	end
end

--historique des coups joués