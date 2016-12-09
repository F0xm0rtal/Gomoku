l = nil

function add_Histo_tab( x, y, player)
	l = { next = l, value = { x = x, y = y, value = 1 , player = player } }
end

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
					return_list = {x = list_prise.x3, y = list_prise.y3 , next = return_list}
				end
			end
		end
		list_prise = list_prise.next
	end
	return return_list
end

function play_IA()
	strongx, strongy = bring_me_the_strongest()
	print(x, y)

end

function bring_me_the_strongest()
	i = 1
	while l do
		if (l.value.value > i) then
			i = l.value.value
			posx = l.value.x
			posy = l.value.y
		end
	end
	return posx, posy
end