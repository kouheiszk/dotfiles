local configFileWatcher = nil
local appWatcher = nil
local bindGroupTable = {}

-- 設定の自動読み込み
local function reloadConfig()
    configFileWatcher:stop()
    configFileWatcher = nil
    appWatcher:stop()
    appWatcher = nil
    hs.reload()
end

--configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
--configFileWatcher:start()

local function eventTapWithKey(key, modifiers)
  modifiers = modifiers or {}
  return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  end
end

local function eventTapWithCode(code, modifiers)
  modifiers = modifiers or {}
  return function()
      hs.eventtap.event.newKeyEvent(modifiers, " ", true):setKeyCode(code):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, " ", false):setKeyCode(code):post()
  end
end

local function bind(modifiers, key, eventTap)
    modifiers = modifiers or {}
    return hs.hotkey.bind(modifiers, key, eventTap, nil, eventTap)
end

local function disableHotkeys(hotkeys)
    for k, v in pairs(hotkeys) do
        v:disable()
    end
end

local function enableHotkeys(hotkeys)
    for k, v in pairs(hotkeys) do
        v:enable()
    end
end

local function tableLength(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count
end

local function applicationWatcher(appName, eventType, appObject)
    if eventType == hs.application.watcher.activated then
        for _, hotkeys in pairs(bindGroupTable) do
            local option = getmetatable(hotkeys)
            if tableLength(option.only) > 0 then
                if option.only[appName] == true then
                    enableHotkeys(hotkeys)
                else
                    disableHotkeys(hotkeys)
                end
            end
            if tableLength(option.except) > 0 then
                if option.except[appName] == true then
                    disableHotkeys(hotkeys)
                else
                    enableHotkeys(hotkeys)
                end
            end
        end
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()

local function bindGroup(option, ...)
    local hotkeys = {...}
    local only = {}
    local except = {}

    if (option.only and "defined" or "undef") == "defined" then
        for _, v in pairs(option.only) do
            only[v] = true
        end
    end
    if (option.except and "defined" or "undef") == "defined" then
        for _, v in pairs(option.except) do
            except[v] = true
        end
    end

    setmetatable(hotkeys, {only=only, except=except})
    table.insert(bindGroupTable, hotkeys)
end

-- キーバインドの設定

bindGroup(
    {except={"iTerm2"}},

    bind({"ctrl"}, "h", eventTapWithKey("left")),
    bind({"ctrl"}, "j", eventTapWithKey("down")),
    bind({"ctrl"}, "k", eventTapWithKey("up")),
    bind({"ctrl"}, "l", eventTapWithKey("right")),

    bind({"ctrl", "shift"}, "h", eventTapWithKey("left", {"shift"})),
    bind({"ctrl", "shift"}, "j", eventTapWithKey("down", {"shift"})),
    bind({"ctrl", "shift"}, "k", eventTapWithKey("up", {"shift"})),
    bind({"ctrl", "shift"}, "l", eventTapWithKey("right", {"shift"})),

    bind({"ctrl", "cmd"}, "h", eventTapWithKey("left", {"cmd"})),
    bind({"ctrl", "cmd"}, "j", eventTapWithKey("down", {"cmd"})),
    bind({"ctrl", "cmd"}, "k", eventTapWithKey("up", {"cmd"})),
    bind({"ctrl", "cmd"}, "l", eventTapWithKey("right", {"cmd"})),

    bind({"ctrl", "alt"}, "h", eventTapWithKey("left", {"alt"})),
    bind({"ctrl", "alt"}, "j", eventTapWithKey("down", {"alt"})),
    bind({"ctrl", "alt"}, "k", eventTapWithKey("up", {"alt"})),
    bind({"ctrl", "alt"}, "l", eventTapWithKey("right", {"alt"})),

    bind({"ctrl", "shift", "cmd"}, "h", eventTapWithKey("left", {"shift", "cmd"})),
    bind({"ctrl", "shift", "cmd"}, "j", eventTapWithKey("down", {"shift", "cmd"})),
    bind({"ctrl", "shift", "cmd"}, "k", eventTapWithKey("up", {"shift", "cmd"})),
    bind({"ctrl", "shift", "cmd"}, "l", eventTapWithKey("right", {"shift", "cmd"})),

    bind({"ctrl", "shift", "alt"}, "h", eventTapWithKey("left", {"shift", "alt"})),
    bind({"ctrl", "shift", "alt"}, "j", eventTapWithKey("down", {"shift", "alt"})),
    bind({"ctrl", "shift", "alt"}, "k", eventTapWithKey("up", {"shift", "alt"})),
    bind({"ctrl", "shift", "alt"}, "l", eventTapWithKey("right", {"shift", "alt"})),

    bind({"ctrl", "cmd", "alt"}, "h", eventTapWithKey("left", {"cmd", "alt"})),
    bind({"ctrl", "cmd", "alt"}, "j", eventTapWithKey("down", {"cmd", "alt"})),
    bind({"ctrl", "cmd", "alt"}, "k", eventTapWithKey("up", {"cmd", "alt"})),
    bind({"ctrl", "cmd", "alt"}, "l", eventTapWithKey("right", {"cmd", "alt"})),

    bind({"ctrl"}, "d", eventTapWithKey("forwarddelete"))
)

bindGroup(
    {only={"iTerm2"}},

    bind({}, "escape", eventTapWithCode(0x66)),
    bind({"control"}, "[", eventTapWithCode(0x66)),
    bind({"control"}, "c", eventTapWithCode(0x66))
)

-- 設定読み込みの確認
--hs.alert.show("Config loaded")
