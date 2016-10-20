require "menu"
require "game"
require "opt_manu" 

function love.load()
	--variables
	c_menu = 1
	c_item = 1
	menus = {{"Solo", "Duo", "Options", "Manual", "Exit",},
    		{"line1","line2","line3","line4",}}

	--gamestate
	state = "menu"

	--plateau de jeux
    p_goban = init_aray()
    p_goban[10][10] = 2

    --images
   	i_glados = love.graphics.newImage("img/glados.png")

    --font
    fo_menu = love.graphics.newFont('img/terminal_ldr.ttf', 28)
    fo_titre = love.graphics.newFont('img/terminal_ldr.ttf', 72)

   	--sound
    s_main = love.audio.newSource("sound/Portal_2_Soundtrack_-_The_Main_Menu.ogg")

    --game file arbitre
    f_game = io.open(".game", "w")
    f_goban = io.open(".plateau", "w")
    -- f_game:write("")
    -- f_game:close()

	s_main:play()
end

function love.keypressed(k)
	if k == 'escape' and state == "menu" then
		love.event.quit()
		os.remove("test.txt")
	elseif k == 'up' then
		c_item = c_item - 1
		c_item = c_item % 5
	elseif k == 'down' then
	    c_item = c_item + 1
    	c_item = c_item % 5
	end
end

function love.update(t)
	if state == "game" or state == "game2" then
		-- body
	elseif state == "pause" then
		-- body
	end
end

function love.draw()
	if state == "menu" then
		menu_draw()
	elseif state == "game" then
		game_draw()
	elseif state == "game2" then
		game_draw()
	elseif state == "option" then
		opt_draw()
	elseif state == "manual" then
		manu_draw()
	end
end

function echap()
		if love.keyboard.isDown('escape') then
		state = "menu"
    end
end