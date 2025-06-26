config.load_autoconfig(False)

# Font family
c.fonts.default_family = "monospace"
# Prefer dark mode
c.tabs.background = True
c.tabs.favicons.scale = 1.2

c.window.transparent = True

c.downloads.position = "bottom"
c.downloads.location.directory = "$HOME/Downloads/"

c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.policy.images = "never"

c.content.autoplay = False

c.content.blocking.enabled = True
c.content.blocking.method = "both"
c.content.blocking.adblock.lists = [
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2025.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2025.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-general.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-mobile.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/lan-block.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
    "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
]

c.url.searchengines['aw'] = 'https://wiki.archlinux.org/?search={}'
c.url.searchengines['aur'] = 'https://aur.archlinux.org/packages?O=0&SeB=nd&K={}&outdated=&SB=p&SO=d&PP=50&submit=Go'
c.url.searchengines['chatgpt'] = 'https://chat.openai.com/?q={}'
c.url.searchengines['yt'] = "https://www.youtube.com/results?search_query={}";
c.url.searchengines['g']= "https://www.google.co.in/search?q={}";
c.url.searchengines['gitrepo'] = "https://www.github.com/search?q={}&type=repositories"
c.url.searchengines['gen2'] = "https://packages.gentoo.org/packages/search?q={}"
c.url.searchengines['gen2overlay']: "https://gpo.zugaina.org/Search?search={}"
c.url.searchengines['gw'] = "https://wiki.gentoo.org/index.php?search={}"

# NOTE: These lines cause cloudfare loop of "Verify if you are a Human"
# c.content.headers.user_agent = (
#     "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)"
#     " Chrome/80.0.3987.163 Safari/537.36"
# )

c.content.javascript.clipboard = 'access'

# Will Come handy
c.auto_save.session = False # Turned off for now

# Keybindings
config.bind('yv', 'hint links spawn -ov mpv {hint-url}')
config.bind('yV', 'spawn -ov mpv {url}')
config.bind('yA', 'spawn -ov mpv --force-window --no-video {url}')
config.bind('ya', 'hint links spawn -ov mpv --force-window --no-video {hint-url}')

# Because stuff isn't working
# c.qt.force_software_rendering = "chromium"

# For the vulkan backend
c.qt.environ = {"QTWEBENGINE_FORCE_USE_GBM":"0"}
c.qt.args = ["ignore-gpu-blocklist", "enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder"]

#  _ __ ___  ___  ___       _ __ (_)_ __   ___ 
# | '__/ _ \/ __|/ _ \_____| '_ \| | '_ \ / _ \
# | | | (_) \__ \  __/_____| |_) | | | | |  __/
# |_|  \___/|___/\___|     | .__/|_|_| |_|\___|
#                          |_|

import os
from urllib.request import urlopen

# load your autoconfig, use this, if the rest of your config is empty!
# config.load_autoconfig()

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/aalbegr/qutebrowser-rose-pine/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'rose-pine', True)
