require "menu"
require "game"
require "opt_manu" 

function love.load()
    --variables
    c_menu = 1
    c_item = 1
    menus = {{"Solo", "Duo", "Options", "Manual", "Exit",}}

    turn = 1
    --gamestate
    state = "menu"

    --plateau de jeux
    p_goban = init_aray()
    p_goban[9][9] = 3

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
    cake = false
    
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

    -- s_main:play()
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
    	p_goban = init_aray()
    end
end
