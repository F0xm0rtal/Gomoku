require "menu"
require "game"
require "opt_manu" 

function love.load()
	c_menu = 1
	c_item = 1
	state = "menu"
end

function love.keypressed(k)
	if k == 'escape' and state == "menu" then
		love.event.quit()
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
