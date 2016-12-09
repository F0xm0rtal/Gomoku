l = nil

function add_Histo_tab( x, y, player)
	l = { next = l, value = { x, y, value = 1 , player = player } }
end

function play_IA()
	strongx, strongy = bring_me_the_strongest()
	print(x, y)

end

function bring_me_the_strongest()
	i = 1
	for #l.value.value do
		if (value.value > i)
			i = value.value
			posx = l.value.x
			posy = l.value.y
		end
	end
	return posx, posy
end