
let uninstalled_plugins = filter(copy(g:plugs), '!isdirectory(v:val.dir)')

if !empty(uninstalled_plugins)
	echo 'Plugins not installed:'
	echo keys(copy(uninstalled_plugins))
endif

