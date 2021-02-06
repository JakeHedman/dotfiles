source /usr/share/fish/vendor_completions.d/pass.fish

complete -c $PROG -f -A -n '__fish_pass_uses_command new' -a "(__fish_pass_print_entry_dirs)"
