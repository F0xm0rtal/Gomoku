require "menu"
require "game"
require "opt_manu"
require "../IA/MinMax"
require "arbitre"


function love.load()
    --variables
    c_menu = 1
    c_item = 1
    c_truc = 1
    menus = {"Solo", "Duo", "Options", "Manual", "Exit"}
    opt_menu = {"menu", "game", "game2", "option", "manual"}
    ech = 0
    imba = 0
    turn = 1
    
    --modes
    mode_impa = false
    mode_break = false
    
    --gamestate
    state = "menu"

    --plateau de jeux
    p_goban = init_aray()
    score = {0, 0}

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
    s_score = "init_score"
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
        love.graphics.setFont(love.graphics.newFont(21))
        ech = 0
    elseif k == 'left' then
        c_truc = c_truc - 1
        c_truc = c_truc % 2
    elseif k == 'right' then
        c_truc = c_truc + 1
        c_truc = c_truc % 2
    elseif k == 'up' and state == "menu" then
        c_item = c_item - 1
        c_item = c_item % 5
    elseif k == 'down' and state == "menu" then
        c_item = c_item + 1
		c_item = c_item % 5
    elseif k == 'return' and state == "menu" then
        state = opt_menu[c_item+1]
    elseif k == 'return' and ech == 1 and c_truc == 1 then
        ech = 0
    elseif k == 'return' and ech == 1 and c_truc == 0 then
        state = "menu"
        win = false
        turn = 1
        p_goban = init_aray()
        c_truc = 1
        ech = 0
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
    if state == "menu" and ech == 0 then
		menu_draw()
    elseif state == "game" and ech == 0 then
		game_draw()
    elseif state == "game2" and ech == 0 then
		game_draw()
    elseif state == "option" and ech == 0 then
		opt_draw()
    elseif state == "manual" and ech == 0 then
		manu_draw()
    end
    if ech == 1 then
        echap()
    end
end

function echap()
	    love.graphics.setColor(255, 0, 0, 100)
	    love.graphics.rectangle( "fill", 430, 430, 130, 60)
	    love.graphics.setColor(255, 255, 255, 100)
	    love.graphics.setFont(love.graphics.newFont(21))
	    love.graphics.print("Quit ?", 440, 430)
	    love.graphics.print("YES", 440, 460)
	    love.graphics.print("/", 482, 460)
	    love.graphics.print("NOPE", 492, 460)
	    love.graphics.setColor(0, 0, 0, 100)
	    if c_truc == 0 and state ~= "menu" then
	    	love.graphics.rectangle( "fill", 440, 460, 40, 25)
	    end
	    if c_truc == 1 and state ~= "menu" then
			love.graphics.rectangle( "fill", 492, 460, 60, 25)
	    end
	    love.graphics.setColor(255, 255, 255, 255)
end
