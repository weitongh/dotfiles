import os
import subprocess
from libqtile import bar, layout, widget, hook 
from libqtile.config import Key, Drag, Match, Screen, Group
from libqtile.lazy import lazy


wmname = 'Qtile'
accent_color = '#61AAB0'
follow_mouse_focus = False
focus_on_window_activation = 'focus'

mod = 'mod4'
alt = 'mod1'
ctrl = 'control'
shift = 'shift'
terminal = 'alacritty'
screenshot = 'flameshot gui'

keys = [
    Key([mod], 'q', lazy.window.kill()),
    Key([mod], 'f', lazy.next_layout()),
    Key([mod], 'm', lazy.window.toggle_minimize()),
    Key([mod], 'return', lazy.spawn(terminal)),
    Key([mod, shift], 'return', lazy.spawncmd('Run')),

    Key([mod], 'up', lazy.layout.up()),
    Key([mod], 'down', lazy.layout.down()),
    Key([mod], 'left', lazy.layout.left()),
    Key([mod], 'right', lazy.layout.right()),
    Key([mod, ctrl], 'up', lazy.layout.shuffle_up()),
    Key([mod, ctrl], 'down', lazy.layout.shuffle_down()),
    Key([mod, ctrl], 'left', lazy.layout.swap_left()),
    Key([mod, ctrl], 'right', lazy.layout.swap_right()),
    Key([mod, shift], 'left', lazy.layout.shrink_main()),
    Key([mod, shift], 'right', lazy.layout.grow_main()),
    Key([alt, ctrl], 'left', lazy.screen.prev_group()),
    Key([alt, ctrl], 'right', lazy.screen.next_group()),

    Key([alt, ctrl], 'a', lazy.spawn(screenshot)),

    Key([mod, ctrl], 'r', lazy.reload_config()),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating().when(when_floating=True), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating().when(when_floating=True), start=lazy.window.get_size()),
]

groups = [
    Group('1', label=' '),
    Group('2', label=' ', matches=[Match(role='browser')]),
    Group('3', label=' ', matches=[Match(wm_class='QQ'), Match(wm_class='Slack')]),
    Group('4', label=' ', matches=[Match(wm_class='steam'), Match(wm_class='XIVLauncher.Core')]),
    Group('5', label=' ', matches=[Match(wm_class='Clash for Windows')]),
]

widget_defaults = {
    'font': 'Hack Nerd Font',
    'fontsize': 22,
}
sep = widget.Sep(linewidth=2, size_percent=60, padding=10)

screens = [
    Screen(
        top=bar.Bar([
            widget.Spacer(length=10),
            widget.GroupBox(
                padding_x = 6,
                borderwidth = 3,
                toggle = False,
                disable_drag = True,
                use_mouse_wheel = False,
                highlight_method = 'line',
                this_current_screen_border = accent_color,
            ),
            sep,
            widget.Prompt(),

            widget.Spacer(),
            widget.Clock(format='%b %d  %I:%M %p'),
            widget.Spacer(),

            widget.ThermalSensor(format=' CPU {temp:.0f}{unit}', threshold=100, tag_sensor='Package id 0'),
            widget.NvidiaSensors(format='GPU {temp}°C', threshold=100),
            widget.Memory(format=' RAM{MemUsed: .1f}{mm}/{MemTotal: .1f}{mm}', measure_mem='G'),
            sep,
            widget.Wlan(format=' ', disconnected_message='󰖪 '),
            widget.Volume(fmt='  {}'),
            widget.Spacer(length=16),
            ],
            size=50,
            background='#0c0c0c',
        ),
        wallpaper='~/.config/qtile/wallpaper',
        wallpaper_mode='fill',
    ),
]

layouts = [
    layout.MonadTall(margin=8, border_width=2, border_focus=accent_color, new_client_position='bottom'),
    layout.Max(margin=8, border_width=2, border_focus=accent_color),
]

floating_layout = layout.Floating(
    border_width=0,
    float_rules=[
        *layout.Floating.default_float_rules,
    ],
)

# Executes a bash script (autostart.sh) which launches programs for autostart 
@hook.subscribe.startup_once
def autostart():
    script = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([script])
