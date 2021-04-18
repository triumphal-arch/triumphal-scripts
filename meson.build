project('triumphal-scripts',  
          version: '0.1.0',
    meson_version: '>= 0.50.0',
  default_options: [ 'warning_level=2',
                   ],
  license: 'GPL-3.0-or-later',
)

desktop_files = [
    'desktop_files/create_default_appfolders.desktop',
    'desktop_files/hide_ugly_apps.desktop',
]

scripts = [
  'scripts/create_default_appfolders.sh',
  'scripts/hide_ugly_apps.sh',
]

install_data(desktop_files, install_dir: '/etc/skel/.config/autostart/')
install_data(scripts, install_dir: '/opt/triumphal/scripts/')
