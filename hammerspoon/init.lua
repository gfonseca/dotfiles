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


-- Go to Iterm
hs.hotkey.bind({'ctrl', 'alt'}, "pad9", function()
  local app = hs.application.get('iTerm2')
  if not app then
    print("[iterm] app not found, launching")
    hs.application.launchOrFocus('iTerm2')
    return
  end

  local win = app:mainWindow()
  if not win then
    print("[iterm] no mainWindow, activating app")
    app:activate()
    return
  end

  local isMin = win:isMinimized()
  local currentSpace = hs.spaces.activeSpaceOnScreen()
  local winSpaces = hs.spaces.windowSpaces(win)
  local winSpace = winSpaces and winSpaces[1]

  print(string.format("[iterm] minimized=%s currentSpace=%s winSpace=%s", tostring(isMin), tostring(currentSpace), tostring(winSpace)))

  if isMin then
    win:unminimize()
  end

  if winSpace and winSpace ~= currentSpace then
    hs.spaces.gotoSpace(winSpace)
    hs.timer.doAfter(0.3, function()
      win:focus()
    end)
  else
    win:focus()
  end
end)


-- Go to Spotfy
hs.hotkey.bind({'ctrl', 'alt'}, "pad4", function ()
  APP_NAME = 'Spotify'
  hs.application.launchOrFocus(APP_NAME)
end)

-- Go to Arc
hs.hotkey.bind({'ctrl', 'alt'}, "pad7", function ()
  APP_NAME = 'Arc'
  hs.application.launchOrFocus(APP_NAME)
end)

-- Go to Claude
hs.hotkey.bind({'ctrl', 'alt'}, "pad5", function ()
  APP_NAME = 'Claude'
  hs.application.launchOrFocus(APP_NAME)
end)


-- Go to Numer
-- hs.hotkey.bind({'ctrl', 'alt'}, "pad7", function ()
--   APP_NAME = 'Numer'
--   hs.iterm2.open("./numer")
-- end)

-- Go to Cursor5
hs.hotkey.bind({'ctrl', 'alt'}, "pad/", function ()
  APP_NAME = 'Visual Studio Code'
  hs.application.launchOrFocus(APP_NAME)
end)

-- Go to Bruno
hs.hotkey.bind({'ctrl', 'alt'}, "pad*", function ()
  APP_NAME = 'Bruno'
  hs.application.launchOrFocus(APP_NAME)
end)

-- Go to Chrome
hs.hotkey.bind({'ctrl', 'alt'}, "pad-", function ()
  APP_NAME = 'Google Chrome'
  hs.application.launchOrFocus(APP_NAME)
end)

-- Go to Slack
hs.hotkey.bind({'ctrl', 'alt'}, "pad8", function ()
  APP_NAME = 'Slack'
  hs.application.launchOrFocus(APP_NAME)

end)
