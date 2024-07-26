-- https://github.com/asmagill/hs._asm.undocumented.spaces
local spaces = require "hs.spaces"
local screen = require "hs.screen"
function dump(t)
  for k,v in pairs(t) do
    print(k,v)
  end
end
 
 -- Auto reload config
function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
      if file:sub(-4) == ".lua" then
          doReload = true
      end
  end
  if doReload then
      hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Hammerspoon Config loaded")


-- Go to Alacritty
hs.hotkey.bind({'cmd'}, "p", function ()
  APP_NAME = 'Alacritty'
  hs.application.launchOrFocus(APP_NAME)
  local alacritty = hs.application.get(APP_NAME)
  if alacritty then
    local mainWindow = alacritty:mainWindow()
    mainWindow:maximize()
  end
end)

-- Go to Spotfy
hs.hotkey.bind({'cmd'}, "[", function ()
  APP_NAME = 'Spotify'
  hs.application.launchOrFocus(APP_NAME)
end)


-- Go to Arc
hs.hotkey.bind({'cmd'}, "]", function ()
  APP_NAME = 'Arc'
  hs.application.launchOrFocus(APP_NAME)
end)

