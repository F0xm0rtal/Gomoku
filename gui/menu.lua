


function menu_draw( ... )
	menus = {{"Solo", "Duo", "Option", "Manual", "Exit",},
 			{"line1","line2","line3","line4",},
 			{"line1","line2","line3","line4",}}
	
	for i=1, #menus[c_menu] do
		--love.graphics.print(c_item, 300, 360)
 		if c_item == 1 then
			love.graphics.setColor(100, 145, 125, 100)
	   		love.graphics.print(menus[c_menu][c_item], 400, 300 + 20 * c_item)
	   	elseif c_item == 2 then
			love.graphics.setColor(100, 145, 125, 100)
	   		love.graphics.print(menus[c_menu][c_item], 400, 300 + 20 * c_item)
   		elseif c_item == 3 then
			love.graphics.setColor(100, 145, 125, 100)
	   		love.graphics.print(menus[c_menu][c_item], 400, 300 + 20 * c_item)
   		elseif c_item == 4 then
      		love.graphics.setColor(100, 145, 125, 100)
	   		love.graphics.print(menus[c_menu][c_item], 400, 300 + 20 * c_item)
   		elseif c_item == 0 then
      		love.graphics.setColor(100, 145, 125, 100)
	   		love.graphics.print(menus[c_menu][5], 400, 400)
	   		if love.keyboard.isDown("enter") then
	   			love.event.quit()
	   		end
      	end
		love.graphics.print(menus[c_menu][i], 400, 300 + 20 * i)
    end
end