


function menu_draw( ... )
    menus = {{"Solo", "Duo", "Options", "Manual", "Exit",},
    {"line1","line2","line3","line4",},
    {"line1","line2","line3","line4",}}

    --title
    love.graphics.setFont(love.graphics.newFont(42))
    love.graphics.print("GOMOKU", 280, 50)
    
    --reset police size 
    love.graphics.setFont(love.graphics.newFont(12))
    
    --draw menu
    
    --love.graphics.rectangle( "fill", 380, 300, 100, 140 )
    love.graphics.draw(love.graphics.newImage("glados.png"), 500, 0)
    for i=1, #menus[c_menu] do
        --love.graphics.print(c_item, 300, 360)
        if c_item == 1 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 390, 295 + 20 * c_item, 80, 20 )
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[c_menu][c_item], 400, 300 + 20 * c_item)
        	if love.keyboard.isDown('return') then
                state = "game"
            end
        elseif c_item == 2 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 390, 295 + 20 * c_item, 80, 20 )
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[c_menu][c_item], 400, 300 + 20 * c_item)
        	if love.keyboard.isDown('return') then
                state = "game"
            end
        elseif c_item == 3 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 390, 295 + 20 * c_item, 80, 20 )
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[c_menu][c_item], 400, 300 + 20 * c_item)
            if love.keyboard.isDown('return') then
                state = "option"
            end
        elseif c_item == 4 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 390, 295 + 20 * c_item, 80, 20 )
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[c_menu][c_item], 400, 300 + 20 * c_item)
            if love.keyboard.isDown('return') then
                state = "manual"
            end
        elseif c_item == 0 then
            love.graphics.setColor(128, 128, 128, 255)
            love.graphics.rectangle( "fill", 390, 295 + 20 * 5, 80, 20 )
            love.graphics.setColor(255, 255, 255, 100)
            love.graphics.print(menus[c_menu][5], 400, 400)
            if love.keyboard.isDown('return') then
                love.event.quit()
            end
        end
        love.graphics.print(menus[c_menu][i], 400, 300 + 20 * i)
    end
end
