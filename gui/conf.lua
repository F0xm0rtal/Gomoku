function love.conf(t)
    t.identity = "Aperture Lab."
    t.version = "0.9.1"
    t.console = false
    t.externalstorage = false
    t.gammacorrect = false

    t.window.title = "Gomoku"
    t.window.icon = "cake-a-lie.png"
    t.window.width = 1080
    t.window.height = 860
    t.window.borderless = true
    t.window.resizable = false
    t.window.vsync = true
    t.window.display = 1
    t.window.x = nil
    t.window.y = nil
 end