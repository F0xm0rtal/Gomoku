require "menu"
require "game"

function love.load()
	c_menu = 1
	c_item = 1
	state = "menu"
end

function love.keypressed(k)
	if k == 'escape' then
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
	if state == "menu" then
		-- body
	elseif state == "game" then
		-- body
	end
end

function love.draw()
	if state == "menu" then
		menu_draw()
	elseif state == "game" then
		menu_draw()
	end
end
