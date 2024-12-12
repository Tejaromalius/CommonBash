# >>> tradency >>>
function tradency() {
  package_name="$1"

  if [ -z "$package_name" ]; then
    echo "Usage: list_package_dependencies <package_name>"
    return 1
  fi

  # Check if the package is installed
  if ! apt list --installed 2>/dev/null | grep "$package_name"; then
    echo "⚠️ Error: Package '$package_name' is not installed."
    return 1
  fi

  # Generate and display the list of reverse dependencies
  apt rdepends "$package_name" 2>/dev/null \
      | awk '{print $2}' \
      | xargs dpkg -l 2>/dev/null \
      | grep '^ii' \
      | awk '{print $2}' \
      | sed 's/:amd64//' \
      | sort \
      | nl -w 2 -s ' ' \
      | sed -E "s/^([[:space:]]*[0-9]+)/\x1b[31m\1\x1b[0m/"
}
# <<< tradency <<<
