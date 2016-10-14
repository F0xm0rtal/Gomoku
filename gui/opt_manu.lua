
function opt_draw()
	if love.keyboard.isDown('escape') then
		state = "menu"
	end
end

function manu_draw()
	if love.keyboard.isDown('escape') then
		state = "menu"
    end
	love.graphics.print("AAAAAAAA", 440, 3)
end