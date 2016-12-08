require "menu"
require "game"
require "opt_manu" 
require "arbitre"

function love.load()
    --variables
    c_menu = 1
    c_item = 1
    menus = {"Solo", "Duo", "Options", "Manual", "Exit"}
    ech = 0

    turn = 1
    --gamestate
    state = "menu"

    --plateau de jeux
    p_goban = init_aray()

    --images
    i_glados = love.graphics.newImage("img/glados.png")
    i_glados_jeu = love.graphics.newImage("img/char_glados.jpg")
    i_goban = love.graphics.newImage("img/aperture-laboratories-terminal.jpg")
    i_white = love.graphics.newImage("img/white.png")
    i_black = love.graphics.newImage("img/black.png")
    
    --font
    fo_menu = love.graphics.newFont('img/terminal_ldr.ttf', 28)
    fo_titre = love.graphics.newFont('img/terminal_ldr.ttf', 72)
    
    --text
    s_player = "init_glados"
    s_turn = "init_cake"
    s_win = "init_win"
    cake = false
    win = false
    --sound
    s_main = love.audio.newSource("sound/Portal_2_Soundtrack_-_The_Main_Menu.ogg")

    --cursor
    --i_cursor = love.mouse.newCursor("img/cursor.png", 0, 0)
    --love.mouse.setCursor(i_cursor)

    --game file arbitre
    f_game = io.open(".game", "w")
    f_goban = io.open(".plateau", "w")
    -- f_game:write("")
    -- f_game:close()

    --s_main:play()
end

function love.keypressed(k)
    if k == 'escape' and state == "menu" then
		love.event.quit()
		os.remove("test.txt")
    elseif k == 'escape' and state ~= "menu" and ech == 0 then
        ech = 1
    elseif k == 'escape' and state ~= "menu" and ech == 1 then
        ech = 0
    elseif k == 'up' then
		c_item = c_item - 1
		c_item = c_item % 5
    elseif k == 'down' then
		c_item = c_item + 1
		c_item = c_item % 5
    elseif k == 'c' then
		cake = not cake
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
        ech = 0
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
    if ech == 1 then
        echap()
    end
end

function echap()
    for i=1,10 do
	    love.graphics.setColor(255, 0, 0, 100)
	    love.graphics.rectangle( "fill", 430, 430, 130, 60)
	    love.graphics.setColor(255, 255, 255, 100)
	    love.graphics.setFont(love.graphics.newFont(21))
	    love.graphics.print("Quit ?", 440, 430)
	    love.graphics.print("YES", 440, 460)
	    love.graphics.print("/", 482, 460)
	    love.graphics.print("NOPE", 492, 460)
	    love.graphics.setColor(0, 0, 0, 100)
	    if (c_item % 2) == 0 then
	    	love.graphics.rectangle( "fill", 440, 460, 40, 25)
	    	if love.keyboard.isDown('return') then
	    		-- love.event.quit()
			    state = "menu"
				win = false
				turn = 1
			    p_goban = init_aray()
	    	end
	    end
	    if (c_item % 2) == 1 then
			love.graphics.rectangle( "fill", 492, 460, 60, 25)
	    	if love.keyboard.isDown('return') then
	    		ech = 0
	    	end
		end
	    love.graphics.setColor(255, 255, 255, 255)
	end
end
