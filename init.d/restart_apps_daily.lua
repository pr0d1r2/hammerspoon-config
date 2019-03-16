-- To prevent electron memory bloats we restart apps daily

local function sleep(n)
  os.execute("sleep " .. tonumber(n))
end

local function restartAppPeriodically(period, app_name)
  hs.timer.doEvery(period, function()
    slack = hs.application.get(app_name)
    if slack then
      slack:kill()
    end
    sleep(3)
    hs.application.open(app_name)
  end)
end

local function restartAppDaily(app_name)
  restartAppPeriodically(86400, app_name)
end

restartAppDaily("Slack")
restartAppDaily("Goofy")
