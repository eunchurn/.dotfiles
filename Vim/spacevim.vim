
" Sheharyar's SpaceVim configuration
" ##################################


" Initial Settings
let g:spacevim_enable_debug = 1
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_enable_vimfiler_welcome = 1



" Load Layers
" -----------

call SpaceVim#layers#load('shell')
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('tools#screensaver')

call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#xml')
call SpaceVim#layers#load('lang#elixir')

  " call SpaceVim#layers#load('lang#go')
  " call SpaceVim#layers#load('lang#php')
  " call SpaceVim#layers#load('lang#c')
  " call SpaceVim#layers#load('lang#lua')
  " call SpaceVim#layers#load('lang#haskell')
  " call SpaceVim#layers#load('lang#perl')
  " call SpaceVim#layers#load('lang#swig')
  " call SpaceVim#layers#load('lang#rust')
  " call SpaceVim#layers#load('lang#java')




" Configure SpaceVim
" ------------------

if has("gui_running")                         " Different Colorschemes for GUI / Terminal
  let g:spacevim_colorscheme = 'onedark'     "'gruvbox'
else
  let g:spacevim_enable_guicolors = 0
  let g:spacevim_colorscheme = 'one-dark'
endif


let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:neomake_vim_enabled_makers = ['vimlint', 'vint']
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''
