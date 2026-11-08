#! /usr/bin/env fish

set -g source_dir ~/.config
set -g target_dir (pwd)/.config

mkdir -p $target_dir

function copy_whole
    set config $argv[1]

    if  not test -d $source_dir/$config
        echo "(❌): $config has been skipped, dir $source_dir/$config isn't exist"
        return
    end

    cp -r $source_dir/$config $target_dir

    echo "(✅): $config has been copied."
end

function copy_hyprfm
    set source_config $source_dir/hyprfm
    set target_config $target_dir/hyprfm

    mkdir -p $target_config

    cp $source_config/config.toml $target_config
    cp -r $source_config/themes $target_config
end

copy_whole hypr
copy_whole kitty
copy_hyprfm
copy_whole quickshell
