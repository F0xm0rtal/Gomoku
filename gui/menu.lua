


function menu_draw()
    --title
    love.graphics.setFont(fo_titre)
    love.graphics.print("GOMOKU", 280, 50)
    
    --reset police size 
    love.graphics.setFont(fo_menu)
    
    --draw menu
    love.graphics.draw(i_glados, 500, 0)
    for i=1,5,1 do
        if c_item == 1 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 195, 320 + 20 * c_item, 130, 20 )
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[c_item], 200, 320 + 20 * c_item)
        	if love.keyboard.isDown('return') then
                state = "game"
            end
        elseif c_item == 2 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 195, 320 + 20 * c_item, 130, 20 )
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[c_item], 200, 320 + 20 * c_item)
        	if love.keyboard.isDown('return') then
                state = "game"
            end
        elseif c_item == 3 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 195, 320 + 20 * c_item, 130, 20 )
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[c_item], 200, 320 + 20 * c_item)
            if love.keyboard.isDown('return') then
                state = "option"
            end
        elseif c_item == 4 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 195, 320 + 20 * c_item, 130, 20 )
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[c_item], 200, 320 + 20 * c_item)
            if love.keyboard.isDown('return') then
                state = "manual"
            end
        elseif c_item == 0 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 195, 420, 130, 20)
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[5], 200, 420)
            if love.keyboard.isDown('return') then
                love.event.quit()
            end
        end
        love.graphics.print(menus[i], 200, 320 + 20 * i)
	love.graphics.setColor(255, 255, 255, 255)
    end
end
