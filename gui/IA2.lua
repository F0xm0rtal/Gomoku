-- elem = {x,y minmax, bestmove, list , map, historique ]

function my_minmax()
    local rec = 0
    my_rec(rec)
    local my_list = init_forom_histo()
    print_listia(my_list)
end

function my_rec(rec)
    if rec ~= 3 then
        print("rec", rec)
        return print("return", my_rec(rec + 1))
    else
        print("end", rec)
        return 0
    end
end


-- elem = {x,y minmax, score, list , map, historique ]

function init_forom_histo()
    local historique = list_historique
    local elem
    local list = Table.new()

    for _, s in ipairs(historique) do

        elem = { x = s.x, y = s.y, list = nil, bestmove = nil, map = p_goban, historique = list_historique }
        list:insert(elem)
    end
    return list
end

function generate()
end

function print_listia(list)
    print("========================")
    for _, elem in ipairs(list) do
        print(elem.x,elem.y, elem.list, elem.bestmove, elem.map, elem.historique)
    end
    print("========================")
end