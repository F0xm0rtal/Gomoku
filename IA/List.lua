Table = {}
Table.__index = table

function Table.new()
    local t = {}
    setmetatable(t, Table)
    return t
end

function Table.print(self)
    print("==========")
    for _, s in ipairs(self) do
        print(s.x, s.y, "joueur ", s.joueur)
    end
    print("==========")
end

function size(liste)
    local i = 0
    for _, s in ipairs(liste) do
        i = i + 1
    end
    return i
end

function remove_from_list(list, x, y)
    for i, elem in ipairs(list) do
        if elem.x == x and elem.y == y then
            list:remove(i)
        end
    end
end

--historique des coups joués
list_historique = Table.new()

list_moves = Table.new()
lignes = Table.new()
