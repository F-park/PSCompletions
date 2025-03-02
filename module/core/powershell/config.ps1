$PSCompletions.default.env = @{
    # env
    language      = $PSUICulture
    update        = 1
    module_update = 1
    github        = 'https://github.com/abgox/PSCompletions'
    gitee         = 'https://gitee.com/abgox/PSCompletions'
    url           = ''
    disable_cache = 0
}
$PSCompletions.default.symbol = @{
    symbol_SpaceTab      = [char]::ConvertFromUtf32([convert]::ToInt32(("U+1F604" -replace 'U\+', '0x'), 16))
    symbol_WriteSpaceTab = [char]::ConvertFromUtf32([convert]::ToInt32(("U+1F60E" -replace 'U\+', '0x'), 16))
    symbol_OptionTab     = [char]::ConvertFromUtf32([convert]::ToInt32(("U+1F914" -replace 'U\+', '0x'), 16))
}
$PSCompletions.default.menu_line = @{
    # menu line
    menu_line_horizontal   = [string][char]9552
    menu_line_vertical     = [string][char]9553
    menu_line_top_left     = [string][char]9556
    menu_line_bottom_left  = [string][char]9562
    menu_line_top_right    = [string][char]9559
    menu_line_bottom_right = [string][char]9565
}
$PSCompletions.default.menu_color = @{
    # menu color
    menu_color_item_text     = 'Blue'
    menu_color_item_back     = 'Black'
    menu_color_selected_text = 'white'
    menu_color_selected_back = 'DarkGray'
    menu_color_filter_text   = 'Yellow'
    menu_color_filter_back   = 'Black'
    menu_color_border_text   = 'DarkGray'
    menu_color_border_back   = 'Black'
    menu_color_status_text   = 'Blue'
    menu_color_status_back   = 'Black'
    menu_color_tip_text      = 'Cyan'
    menu_color_tip_back      = 'Black'
}
$PSCompletions.default.menu_config = @{
    # menu config
    enter_when_single            = 0
    menu_enable                  = 1
    menu_show_tip                = 1
    menu_completions_sort        = 1
    menu_selection_with_margin   = 1
    menu_tip_follow_cursor       = 0
    menu_tip_cover_buffer        = 1
    menu_list_follow_cursor      = 1
    menu_list_cover_buffer       = 0
    menu_list_margin_left        = 0
    menu_list_margin_right       = 0
    menu_list_min_width          = 10
    menu_is_prefix_match         = 0
    menu_above_margin_bottom     = 0
    menu_above_list_max_count    = -1
    menu_below_list_max_count    = -1
    menu_between_item_and_symbol = ' '
    menu_status_symbol           = '/'
    menu_filter_symbol           = '[]'
}
# completion config
$PSCompletions.default.comp_config = @{}

Add-Member -InputObject $PSCompletions -MemberType ScriptMethod get_config {
    if (Test-Path $this.path.config) {
        $c = $PSCompletions.ConvertFrom_JsonToHashtable($this.get_raw_content($this.path.config))
        if ($c) {
            foreach($_ in @('env', 'symbol', 'menu_line', 'menu_color', 'menu_config')){
                foreach ($config in $this.default.$_.Keys) {
                    if ($config -notin $c.keys) {
                        $hasDiff = $true
                        $c.$config = $this.default.$_.$config
                    }
                }
            }
            if ($c.comp_config -eq $null) {
                $hasDiff = $true
                $c.comp_config = @{}
            }
            if ($hasDiff) {
                $c | ConvertTo-Json | Out-File $this.path.config -Encoding utf8 -Force
            }
            return $c
        }
        else {
            $need_init = $true
        }
    }
    else {
        $need_init = $true
    }
    if ($need_init) {
        $c = @{}
        foreach($_ in @('env', 'symbol', 'menu_line', 'menu_color', 'menu_config')){
            foreach ($config in $this.default.$_.Keys) {
                $c.$config = $this.default.$_.$config
            }
        }
        $c.comp_config = @{}
        $c | ConvertTo-Json | Out-File $this.path.config -Encoding utf8 -Force
    }
    return $c
}

Add-Member -InputObject $PSCompletions -MemberType ScriptMethod set_config {
    param ([string]$k, $v)
    $this.config = $this.get_config()
    $this.config.$k = $v
    $this.config | ConvertTo-Json | Out-File $this.path.config -Encoding utf8 -Force
}
