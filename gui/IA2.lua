Min = 1
Max = 2
recMAX = 1
function my_minmax()
    local rec = 0
    local _turn = turn
    local my_list = init_from_histo()
    --    print_listia(my_list)
    --    calc(my_list, my_list[1].map, 1)
    generate(my_list, Min, my_list[1].map, 0)
    --    set_max(my_list[1])
    --    print_map(p_goban)
    --    print_listia(my_list, 0)
    if calc_MinMax(my_list) == "played" then
        print_listia(my_list, 0)
        list_clear(my_list)
        return "played"
    end
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

function generate_map(map)
    local array = {}

    for i = 1, 17 do
        array[i] = {}
        for j = 1, 17 do
            array[i][j] = map[i][j]
        end
    end
    return array
end

-- elem = {x,y minmax, score, list , map, historique ]

function init_from_histo()
    local historique = list_historique
    local elem
    local list = Table.new()
    local map = generate_map(p_goban)

    for _, s in ipairs(historique) do
        elem = { x = s.x, y = s.y, list = Table.new(), bestmove = nil, map = map, historique = list_historique }
        list:insert(elem)
    end
    return list
end

function fill_map(map, x, y, minmax)
    local map = generate_map(map)
    map[x][y] = minmax
    local list = init_prise_liste2(x, y)
    for _, e in ipairs(list) do
        if e.x1 < 18 and e.y1 < 18 and e.x1 > 0 and e.y1 > 0 and map[e.x1][e.y1] == 0 then
            map[e.x1][e.y1] = 3
        end
    end
    return map
end

function generate(my_list, minMax, map, it)
    local temp
    local list

    for _, elem in ipairs(my_list) do
        list = init_prise_liste2(elem.x, elem.y)
        for _, e in ipairs(list) do
            if elem.map[e.x1][e.y1] == 3 then
                temp = { x = e.x1, y = e.y1, list = Table.new(), bestmove = nil, map = elem.map, minMax = minMax }
                temp.map = fill_map(temp.map, temp.x, temp.y, temp.minMax)
                elem.list:insert(temp)
            end
        end
        --        print_listia(elem.list, 0)
        if it < recMAX then
            if minMax == Max then
                elem = generate2(elem, Min, elem.map, it + 1)
            elseif minMax == Min then
                elem = generate2(elem, Max, elem.map, it + 1)
            else
                elem = generate2(elem, Min, elem.map, it + 1)
            end
        end
    end
    return my_list
end

function generate2(my_list, minMax, map, it)
    local temp
    local list

    for _, elem in ipairs(my_list.list) do
        list = init_prise_liste2(elem.x, elem.y)
        for _, e in ipairs(list) do
            if e.x1 < 18 and e.y1 < 18 and elem.map[e.x1][e.y1] == 3 then
                temp = { x = e.x1, y = e.y1, list = Table.new(), bestmove = nil, map = elem.map, minMax = minMax }
                temp.map = fill_map(temp.map, temp.x, temp.y, temp.minMax)
                elem.list:insert(temp)
            end
        end
        if it < recMAX then
            if minMax == Max then
                elem = generate2(elem, Min, elem.map, it + 1)
            else
                elem = generate2(elem, Max, elem.map, it + 1)
            end
        end
    end
    return my_list
end

function print_t(rec)
    for _i = 1, rec, 1 do
        io.write("\t")
    end
end

function print_listia(list, rec)
    local minmax
    if list[1].minMax == Max then
        minmax = "Max"
    else
        minmax = "Min"
    end

    print_t(rec)
    print("========================")
    print_t(rec)
    print("size", size(list), "MinMax", minmax)
    for _, elem in ipairs(list) do
        print_t(rec)
        print("|", elem.x, elem.y, elem.list, elem.bestmove, elem.map, elem.minMax)
        if elem.list and size(elem.list) > 0 then
            print_listia(elem.list, rec + 1)
        end
    end
    print_t(rec)
    print("========================")
end

function print_map(map)
    for e = 1, 17 do
        for i = 1, 17 do
            if map[e][i] ~= 0 then
                io.write(map[e][i])
            else
                io.write(' ')
            end
        end
        io.write('\n')
    end
end

function list_clear(list)
    while #list ~= 0 do
        rawset(list, #list, nil)
    end
end

function calc_MinMax(list)

    local score = score
    local returnvalue = { x = 0, y = 0, bestmove = -2 }
    local tmp
    --    print("====================================")
    for _, elem in ipairs(list) do
        tmp = calc_list1(elem.list)
        if tmp.bestmove > returnvalue.bestmove or tmp.bestmove == -1 then
            returnvalue = tmp
        end
    end
    --    print("====================================")
    --    list_clear(list)
    if returnvalue.bestmove ~= 0 then
        return IA_tab(returnvalue.x, returnvalue.y)
    else
        local plop = calc_move()
        return IA_tab(plop.x, plop.y)
    end
end

function calc_list1(list)
    local temp
    local listmoves = Table.new()
    --    print("\t====================================")
    for _, elem in ipairs(list) do
        elem.list = calc_list2(elem.list)
        elem = calc_bestmove(elem, score[2])
        temp = get_best_score(elem.list)
        --        print("\t", elem.x, elem.y, elem.bestmove)
        listmoves:insert(temp)
    end
    --    print("\t====================================")
    local test, it = get_best_score(listmoves)
    local test2, it2 = get_best_score(list)
    if test then
        list_clear(listmoves)
        if test2.bestmove == -1 then
            print("return test2")
            return test2
        elseif test.bestmove == 0 then
            print("return test2")
            return test2
        elseif test2.bestmove ~= 0 and list[it].bestmove == 0 then
            print("return test2")
            return test2
        elseif test.bestmove == -1 then
            print("return test", test.x, test.y)
            return test
        elseif test.bestmove == test2.bestmove then
            print("return test2")
            return test2
        else
            return list[it]
        end
        return list
    end
end

function calc_list2(list)
    --    print("\t\t====================================")
    for _, elem in ipairs(list) do
        elem = calc_bestmove(elem, score[1])
        --        print("\t\t", elem.x, elem.y, elem.bestmove)
    end
    --    print("\t\t====================================")
    return list
end

function calc_bestmove(elem, sc)
    local a, p, n = Arbeit.Result(elem.map, elem.x, elem.y, elem.minMax)
    if a == 2 then
        elem.bestmove = -1
        --        print("align", elem.x, elem.y, elem.minMax)
    elseif p == 1 then
        elem.bestmove = 2 * n + sc
        --        print("prise", elem.x, elem.y, elem.minMax)
    else
        elem.bestmove = 0
    end
    return elem
end

function get_best_score(list)
    local value = 0
    local best = -1
    for _, elem in ipairs(list) do
        if elem.bestmove == -1 then
            best = _
            value = -1
        elseif elem.bestmove >= value and value ~= -1 then
            best = _
            value = elem.bestmove
        end
    end
    if best ~= -1 then
        return list[best], best
    end
end

function get_worse_score(list)
    local worse = -1
    local value = 10
    for _, elem in ipairs(list) do

        if elem.bestmove == -1 and value >= 10 then
            worse = _
            value = 10
        elseif elem.bestmove < value then
            worse = _
        end
    end
    if worse ~= -1 then
        return list[worse], worse
    end
end