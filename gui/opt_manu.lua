
function opt_draw()

	--option son + mod épilepsie 
	love.graphics.setFont(love.graphics.newFont(42))
	love.graphics.print("OPTI0N", 50, 50)
	love.graphics.setFont(love.graphics.newFont(12))
	s_main:setVolume(0.9)
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
	love.graphics.print("ou bien de capturer 10 pierres adverses en encadrant deux pierres adverses par ses propres pierres.", 50,145)
	love.graphics.print("Cette règle stipule qu'un alignement ne permet pas de gagner la partie tant que", 50, 250)
	love.graphics.print("celui-ci est susceptible d'être \"cassé\" par une prise.", 50, 265)
	love.graphics.print("Cette règle stipule qu'il est interdit de poser une pierre conduisant à la formation de deux alignements libres de trois pierres en ayant une en commun.", 50, 450)
	love.graphics.print("Attention, cette pierre n'est pas forcément celle de l'intersection !", 50, 465)
end