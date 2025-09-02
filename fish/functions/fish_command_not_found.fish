function fish_command_not_found
	set cmd $argv[1]
	if test -f "$cmd"
		~/scripts/open.sh "$cmd"
	else
		echo "fish: Unknown command: $cmd"
	end
end

