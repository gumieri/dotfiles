local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local os, math, string = os, math, string
local my_table = awful.util.table or gears.table

local pallete   = {}
pallete.black   = "#000000"
pallete.red     = "#CC241D"
pallete.red2    = "#FB4934"
pallete.green   = "#98971A"
pallete.green2  = "#B8BB26"
pallete.yellow  = "#D79921"
pallete.yellow2 = "#FABD2F"
pallete.blue    = "#458588"
pallete.blue2   = "#83A598"
pallete.purple  = "#B16286"
pallete.purple2 = "#D3869B"
pallete.aqua    = "#689D6A"
pallete.aqua2   = "#8EC07C"
pallete.gray    = "#A89984"
pallete.gray2   = "#928374"
pallete.orange  = "#D65D0E"
pallete.orange2 = "#FE8019"

pallete.bg0_h   = "#1D2021"
pallete.bg0_s   = "#32302F"
pallete.bg0     = "#282828"
pallete.bg1     = "#3C3836"
pallete.bg2     = "#504945"
pallete.bg3     = "#665C54"
pallete.bg4     = "#7C6F64"
pallete.fg0     = "#FBF1C7"
pallete.fg1     = "#EBDBB2"
pallete.fg2     = "#D5C4A1"
pallete.fg3     = "#BDAE93"
pallete.fg4     = pallete.gray

pallete.fg      = pallete.fg1
pallete.bg      = pallete.bg0

local theme                                     = {}
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow"
theme.wallpaper                                 = "~/Pictures/wallpaper"
theme.font                                      = "Sauce Code Powerline Regular 11"
theme.fg_normal                                 = pallete.gray2
theme.fg_focus                                  = pallete.fg
theme.fg_urgent                                 = "#C83F11"
theme.bg_normal                                 = pallete.bg0_h
theme.bg_focus                                  = pallete.bg0_h
theme.bg_urgent                                 = pallete.red2
theme.taglist_fg_focus                          = pallete.fg
theme.tasklist_bg_focus                         = "#tD2021"
theme.tasklist_fg_focus                         = pallete.fg
theme.border_width                              = 0
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#6F6F6F"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = pallete.bg0_h
theme.titlebar_bg_normal                        = pallete.bg0_h
theme.titlebar_fg_focus                         = pallete.bg0_h
theme.menu_height                               = 16
theme.menu_width                                = 18
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_music_pause                        = theme.dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/stop.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 1
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

-- ALSA volume
theme.volume = lain.widget.alsabar({
    notification_preset = { font = "Sauce Code Powerline Regular 10", fg = pallete.black },
  })

-- MPD
local musicplr = awful.util.terminal .. " -title Music -g 130x34-320+16 -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(theme.widget_music)
mpdicon:buttons(my_table.join(
    awful.button({ modkey }, 1, function ()
      awful.spawn.with_shell(musicplr)
    end),
    awful.button({ }, 1, function ()
      awful.spawn.with_shell("mpc prev")
      theme.mpd.update()
    end),
    awful.button({ }, 2, function ()
      awful.spawn.with_shell("mpc toggle")
      theme.mpd.update()
    end),
    awful.button({ }, 3, function ()
      awful.spawn.with_shell("mpc next")
      theme.mpd.update()
    end)))

    theme.mpd = lain.widget.mpd({
        settings = function()
          if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(theme.widget_music_on)
            widget:set_markup(markup.font(theme.font, markup("#FF8466", artist) .. " " .. title))
          elseif mpd_now.state == "pause" then
            widget:set_markup(markup.font(theme.font, " mpd paused "))
            mpdicon:set_image(theme.widget_music_pause)
          else
            widget:set_text("")
            mpdicon:set_image(theme.widget_music)
          end
        end
      })

    -- fs
    theme.fs = lain.widget.fs({
        notification_preset = { fg = pallete.black, bg = theme.bg_normal, font = "Sauce Code Powerline Regular 10" },
        settings = function()
          local fsp = string.format(" %3.2f %s ", fs_now["/"].free, fs_now["/"].units)
          widget:set_markup(markup.font(theme.font, markup(pallete.black, fsp)))
        end
      })

    -- Battery
    local baticon = wibox.widget.imagebox(theme.widget_battery)
    local bat = lain.widget.bat({
        settings = function()
          if bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
              widget:set_markup(markup.font(theme.font, " AC "))
              baticon:set_image(theme.widget_ac)
              return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
              baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
              baticon:set_image(theme.widget_battery_low)
            else
              baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
          else
            widget:set_markup()
            baticon:set_image(theme.widget_ac)
          end
        end
      })

    function theme.powerline_rl(cr, width, height)
      local arrow_depth, offset = height/2, 0

      -- Avoid going out of the (potential) clip area
      if arrow_depth < 0 then
        width  =  width + 2*arrow_depth
        offset = -arrow_depth
      end

      cr:move_to(offset + arrow_depth         , 0        )
      cr:line_to(offset + width               , 0        )
      cr:line_to(offset + width - arrow_depth , height/2 )
      cr:line_to(offset + width               , height   )
      cr:line_to(offset + arrow_depth         , height   )
      cr:line_to(offset                       , height/2 )

      cr:close_path()
    end

    local function pl(widget, bgcolor, padding)
      return wibox.container.background(wibox.container.margin(widget, 16, 16), bgcolor, theme.powerline_rl)
    end

    function theme.at_screen_connect(screen)
      -- Quake application
      screen.quake = lain.util.quake({ app = awful.util.terminal })

      -- If wallpaper is a function, call it with the screen
      local wallpaper = theme.wallpaper
      if type(wallpaper) == "function" then
        wallpaper = wallpaper(screen)
      end
      gears.wallpaper.maximized(wallpaper, screen, true)

      -- Tags
      awful.tag(awful.util.tagnames, screen, awful.layout.layouts)

      -- One layoutbox per screen
      screen.mylayoutbox = awful.widget.layoutbox(screen)
      screen.mylayoutbox:buttons(
        my_table.join(
          awful.button({ }, 1, function () awful.layout.inc( 1) end),
          awful.button({ }, 3, function () awful.layout.inc(-1) end),
          awful.button({ }, 4, function () awful.layout.inc( 1) end),
          awful.button({ }, 5, function () awful.layout.inc(-1) end)
          )
        )

      -- Create the wibox
      screen.mywibox = awful.wibar({ position = "bottom", screen = screen, height = 18, bg = theme.bg_normal })
      screen.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left
          layout = wibox.layout.fixed.horizontal,
          --spr,
          awful.widget.taglist(screen, awful.widget.taglist.filter.all, awful.util.taglist_buttons),
          awful.widget.prompt(),
          spr,
        },
        { -- Middle
          layout = wibox.layout.fixed.horizontal,
          awful.widget.tasklist(screen, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)
        },
        { -- Right
          layout = wibox.layout.fixed.horizontal,

          lain.util.separators.arrow_left(theme.bg_normal, pallete.bg),

          wibox.widget.systray(),

          -- Music
          wibox.container.background(wibox.container.margin(wibox.widget {
                mpdicon,
                theme.mpd.widget,
                layout = wibox.layout.align.horizontal,
            }, 3, 6), pallete.bg),

          lain.util.separators.arrow_left(pallete.bg, pallete.aqua2),

          -- Memory
          wibox.container.background(wibox.container.margin(wibox.widget {
                lain.widget.mem({
                    settings = function()
                      widget:set_markup(markup.font(theme.font, markup(pallete.black, mem_now.used .. "MB RAM")))
                    end
                  }).widget,
                layout = wibox.layout.align.horizontal
            }, 2, 3), pallete.aqua2),

          lain.util.separators.arrow_left(pallete.aqua2, pallete.blue2),

          -- CPU
          wibox.container.background(wibox.container.margin(wibox.widget {
                lain.widget.cpu({
                    settings = function()
                      widget:set_markup(markup.font(theme.font, markup(pallete.black, "CPU " .. cpu_now.usage .. "%")))
                    end
                  }).widget,
                layout = wibox.layout.align.horizontal
            }, 10, 4), pallete.blue2),

          lain.util.separators.arrow_left(pallete.blue2, pallete.purple2),

          -- Temperature
          wibox.container.background(wibox.container.margin(wibox.widget {
                wibox.widget.imagebox(theme.widget_temp),
                awful.widget.watch({awful.util.shell, '-c', 'sensors | grep Core'}, 30,
                  function(widget, stdout)
                    local temps = ""
                    for line in stdout:gmatch("[^\r\n]+") do
                      temps = temps .. line:match("+(%d+).*°C")  .. "° " -- in Celsius
                    end
                    widget:set_markup(markup.font(theme.font, " " .. temps))
                  end).widget,
                  layout = wibox.layout.align.horizontal
              }, 4, 4), pallete.purple2),

            lain.util.separators.arrow_left(pallete.purple2, pallete.yellow2),

            -- Filesystem
            wibox.container.background(wibox.container.margin(wibox.widget {
                  theme.fs.widget,
                  layout = wibox.layout.align.horizontal
              }, 3, 3), pallete.yellow2),

            lain.util.separators.arrow_left(pallete.yellow2, pallete.orange2),

            -- Battery
            wibox.container.background(wibox.container.margin(wibox.widget {
                  baticon,
                  bat.widget,
                  layout = wibox.layout.align.horizontal
              }, 3, 3), pallete.orange2),

            lain.util.separators.arrow_left(pallete.orange2, "alpha"),

            -- Clock
            wibox.container.background(wibox.container.margin(wibox.widget {
                  wibox.widget.textclock(markup.font(theme.font, markup(pallete.fg, "%Y-%m-%d %H:%M:%S")), 1),
                  layout = wibox.layout.align.horizontal
              }, 5, 5), theme.bg_normal),

            screen.mylayoutbox,
          },
        }
      end

      return theme
