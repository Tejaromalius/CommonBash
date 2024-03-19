# >>> Kync >>>
kync () {
  get_main_theme_file() {
    theme_name=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "\n" | tr -d "='=")
    theme_dir="/usr/share/themes/$theme_name"
    if [ -d "$theme_dir" ]; then
      file="/usr/share/themes/$theme_name/index.theme"
      if [ -f "$file" ]; then
        echo "$file"
        return
      fi
    fi
  }

  main_theme_file=$(get_main_theme_file)

  if [ -n "$main_theme_file" ]; then
    color=$(awk -F'#' '/X-Yaru-Accent-Color=#/{print $2}' "$main_theme_file")
    asusctl led-mode static -c "$color"
  else
    echo "Could not determine the main theme file location."
  fi
}
# <<< Kync <<<