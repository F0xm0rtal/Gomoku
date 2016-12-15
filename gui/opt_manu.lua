function opt_draw()
	
	--option son + mod épilepsie 
	love.graphics.setFont(love.graphics.newFont(42))
	love.graphics.print("OPTI0N", 50, 50)
	love.graphics.setFont(love.graphics.newFont(15))
	
	love.graphics.setColor(128, 128, 128, 255)
	if c_veux == 1 then
		love.graphics.rectangle("fill", 80, 150, 100, 20)
	end
	if c_veux == 2 then
		love.graphics.rectangle("fill", 80, 200, 100, 20)
	end
	if c_veux == 3 then
		love.graphics.rectangle("fill", 80, 250, 100, 20)
	end
	if c_veux == 0 then
		love.graphics.rectangle("fill", 80, 300, 100, 20)
	end
	love.graphics.setColor(255, 255, 255, 100)

	love.graphics.rectangle("line", 50, 150, 10, 10)
	love.graphics.print("3 imparable", 80, 150)
	if mode_impa == true then
		love.graphics.print("x", 50, 145)
	end
	love.graphics.rectangle("line", 50, 200, 10, 10)
	love.graphics.print("Prise des 5", 80, 200)
	if mode_break == true then
		love.graphics.print("x", 50, 195)
	end
	love.graphics.rectangle("line", 50, 250, 10, 10)
	love.graphics.print("option inutile", 80, 250)
	if opt_inu == true then
		love.graphics.print("x", 50, 245)
	end
	love.graphics.rectangle("line", 50, 300, 10, 10)
	love.graphics.print("epi", 80, 300)
	if opt_epi == true then
		love.graphics.print("x", 50, 295)
	end

	-- s_main:setVolume(0.9)
	if love.keyboard.isDown('space') then
		opt = "epi"
	end
end

function manu_draw()
	-- #LE_MANUEL
	love.graphics.setFont(love.graphics.newFont(42))
	love.graphics.print("PRINCIPES DE BASE\n", 50, 50)
	love.graphics.print("LE CINQ CASSABLE", 50, 200)
	love.graphics.print("LE DOUBLE-TROIS", 50, 400)
	love.graphics.setFont(love.graphics.newFont(12))
	love.graphics.print("Le jeu de Gomoku Ninuki se joue sur un goban de 19 lignes par 19.", 50, 100)
	love.graphics.print("Il se joue à deux, chaque joueur posant une pierre à tour de rôle sur une des intersections.", 50, 115)
	love.graphics.print("Le but du jeu est de réussir à aligner 5 pierres,", 50, 130)
	love.graphics.print("ou bien de capturer 10 pierres adverses en encadrant deux pierres adverses par ses propres pierres.", 50, 145)
	love.graphics.print("Cette règle stipule qu'un alignement ne permet pas de gagner la partie tant que", 50, 250)
	love.graphics.print("celui-ci est susceptible d'être \"cassé\" par une prise.", 50, 265)
	love.graphics.print("Cette règle stipule qu'il est interdit de poser une pierre conduisant à la formation de deux alignements libres de trois pierres en ayant une en commun.", 50, 450)
	love.graphics.print("Attention, cette pierre n'est pas forcément celle de l'intersection !", 50, 465)
end