function init_prise_liste(x, y)
    list_prise = nil
    list_prise = {
        x1 = x + 1,
        y1 = y,
        x2 = x + 2,
        y2 = y,
        x3 = x + 3,
        y3 = y,
        next = list_prise
    }
    list_prise = {
        x1 = x,
        y1 = y + 1,
        x2 = x,
        y2 = y + 2,
        x3 = x,
        y3 = y + 3,
        next = list_prise
    }
    list_prise = {
        x1 = x - 1,
        y1 = y,
        x2 = x - 2,
        y2 = y,
        x3 = x - 3,
        y3 = y,
        next = list_prise
    }
    list_prise = {
        x1 = x,
        y1 = y - 1,
        x2 = x,
        y2 = y - 2,
        x3 = x,
        y3 = y - 3,
        next = list_prise
    }
    list_prise = {
        x1 = x + 1,
        y1 = y + 1,
        x2 = x + 2,
        y2 = y + 2,
        x3 = x + 3,
        y3 = y + 3,
        next = list_prise
    }
    list_prise = {
        x1 = x - 1,
        y1 = y - 1,
        x2 = x - 2,
        y2 = y - 2,
        x3 = x - 3,
        y3 = y - 3,
        next = list_prise
    }
    list_prise = {
        x1 = x + 1,
        y1 = y - 1,
        x2 = x + 2,
        y2 = y - 2,
        x3 = x + 3,
        y3 = y - 3,
        next = list_prise
    }
    list_prise = {
        x1 = x - 1,
        y1 = y + 1,
        x2 = x - 2,
        y2 = y + 2,
        x3 = x - 3,
        y3 = y + 3,
        next = list_prise
    }

    return list_prise
end

function init_prise_liste2(x, y)
    local list_prise = Table.new()
    list_prise:insert({
        x1 = x + 1,
        y1 = y,
        x2 = x + 2,
        y2 = y,
        x3 = x + 3,
        y3 = y,
    })
    list_prise:insert({
        x1 = x + 1,
        y1 = y - 1,
        x2 = x + 2,
        y2 = y - 2,
        x3 = x + 3,
        y3 = y - 3,
    })
    list_prise:insert({
        x1 = x,
        y1 = y - 1,
        x2 = x,
        y2 = y - 2,
        x3 = x,
        y3 = y - 3,
    })
    list_prise:insert({
        x1 = x - 1,
        y1 = y - 1,
        x2 = x - 2,
        y2 = y - 2,
        x3 = x - 3,
        y3 = y - 3,
    })
    list_prise:insert({
        x1 = x - 1,
        y1 = y,
        x2 = x - 2,
        y2 = y,
        x3 = x - 3,
        y3 = y,
    })

    list_prise:insert({
        x1 = x - 1,
        y1 = y + 1,
        x2 = x - 2,
        y2 = y + 2,
        x3 = x - 3,
        y3 = y + 3,
    })

    list_prise:insert({
        x1 = x,
        y1 = y + 1,
        x2 = x,
        y2 = y + 2,
        x3 = x,
        y3 = y + 3,
    })

    list_prise:insert({
        x1 = x + 1,
        y1 = y + 1,
        x2 = x + 2,
        y2 = y + 2,
        x3 = x + 3,
        y3 = y + 3,
    })

    return list_prise
end

used = 0
function prise_IA(x, y)

    list_prise = init_prise_liste(x, y)
    return_list = nil
    while list_prise do

        if list_prise.x1 < 18 and list_prise.y1 < 18 and list_prise.x1 > 0 and list_prise.y1 > 0 and list_prise.x2 < 18 and list_prise.y2 < 18 and list_prise.x2 > 0 and list_prise.y2 > 0 then

            if p_goban[list_prise.x1][list_prise.y1] == 2 and p_goban[list_prise.x2][list_prise.y2] == 2 then
                if list_prise.x3 < 18 and list_prise.y3 < 18 and list_prise.x3 > 0 and list_prise.y3 > 0 and p_goban[list_prise.x3][list_prise.y3] == 3 then

                    return_list = { x = list_prise.x3, y = list_prise.y3, next = return_list }
                end
            end
        end
        list_prise = list_prise.next
    end
    return return_list
end

function blockcquage_victoire_IA(historique)
    local list = init_prise_liste(historique.x, historique.y)
    local rslt = nil

    while list do
        if p_goban[list.x1][list.y1] == 3 then
            if align_IA(list.x1, list.y1, historique.joueur) == "win" then

                if rslt == nil then
                    rslt = list
                    rslt.joueur = historique.joueur
                elseif rslt.joueur == 2 and historique.joueur == 1 then
                    rslt = list
                    rslt.joueur = historique.joueur
                end
            end
        end
        list = list.next
    end
    return rslt
end

function align_IA(x, y, joueur)
    for j = -1, 1, 1 do
        for i = -1, 1, 1 do
            --cas "xxxx "
            p = 0
            for c = 1, 4, 1 do
                if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then
                    if not (i == 0 and j == 0) then
                        if p_goban[x + c * i][y + c * j] == joueur then
                            p = p + 1
                        end
                        if p == 4 then
                            return "win"
                        end
                    end
                end
            end
            --cas "x xxx"
            p = 0
            for c = -1, 3, 1 do
                if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then
                    if not (i == 0 and j == 0) then
                        if p_goban[x + c * i][y + c * j] == joueur then
                            p = p + 1
                        end
                        if p == 5 then
                            return "win"
                        end
                    end
                end
            end
            --cas "xx xx"
            p = 0
            for c = -2, 2, 1 do
                if x + c * i < 18 and x + c * i > 0 and y + c * j < 18 and y + c * j > 0 then
                    if not (i == 0 and j == 0) then
                        if p_goban[x + c * i][y + c * j] == joueur then
                            p = p + 1
                        end
                        if p == 5 then
                            return "win"
                        end
                    end
                end
            end
        end
    end
    return "nil"
end

function calc_move()
    --    for i = 1, 17, 1 do
    --        for j = 1, 17, 1 do
    --        end
    --    end
    local move
    for i, elem in ipairs(list_historique) do

        if elem.joueur == 2 then
            move = search_axe(elem)
            if move then
                list_moves:insert(move)
            end
        end
    end
    return list_moves[size(list_moves)]
end

function IA_tab(x, y)
    if win == false then
        return (judge(p_goban, p_goban[x][y], x, y))
    end

    return "nil"
end

-- main de l'ia
function play_IA()
    local move = nil
    local historique = list_historique
    local temp
    for i, elem in ipairs(historique) do
        if move == nil then
            -- tentative blocquage ou de victoire
            local rslt = blockcquage_victoire_IA(elem)
            if rslt ~= nil then

                move = { x = rslt.x1, y = rslt.y1 }
                break
                -- tentative de prise
            elseif elem.joueur == 1 then
                local list = prise_IA(elem.x, elem.y)
                if list ~= nil then

                    move = { x = list.x, y = list.y }
                    break
                end
            else

                temp = calc_move()

            end

        else
            break
        end
    end
    if move == nil then
        move = temp
    end
    if move ~= nil then
        IA_tab(move.x, move.y)
    end
end

function search_axe(elem)
    local list = init_prise_liste2(elem.x, elem.y)
    local it = 0
    local move = nil
    for i, elem in ipairs(list) do

        if p_goban[elem.x1][elem.y1] == 2 then
            if i + 4 <= 8 then
                it = i + 4
            else
                it = i + 4 - 8
            end
            if p_goban[list[it].x1][list[it].y1] == 3 then
                move = { x = list[it].x1, y = list[it].y1 }
                break
            end
        end
    end
    if move == nil then
        for i, elem in ipairs(list) do
            if p_goban[elem.x1][elem.y1] == 3 then
                move = { x = elem.x1, y = elem.y1 }
                break
            end
        end
    end

    return move
end
