scriptencoding utf-8

if exists('g:loaded_lazyk9s_vim') | finish | endif

let s:save_cpo = &cpoptions
set cpoptions&vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lazyk9s_floating_window_winblend = 0
let g:lazyk9s_floating_window_scaling_factor = 0.9
let g:lazyk9s_use_neovim_remote = executable('nvr') ? 1 : 0
let g:lazyk9s_floating_window_border_chars = ['╭','─', '╮', '│', '╯','─', '╰', '│']
let g:lazyk9s_use_custom_config_file_path = 0
let g:lazyk9s_config_file_path = ''

command! LazyK9s lua require'lazyk9s'.lazyk9s()

""""""""""""""""""""""""""""""""""""""""""""""""""""""

let &cpoptions = s:save_cpo
unlet s:save_cpo

let g:loaded_lazyk9s_vim = 1
