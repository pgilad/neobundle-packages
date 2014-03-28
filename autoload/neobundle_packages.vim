if v:version < 704
  finish
endif

let s:save_cpo=&cpo
set cpo&vim

let s:pluginDir = '/neobundle-packages/packages/'

if !exists(":NeoBundle")
    echom "Please load NeoBundle before.."
    finish
endif

python import json,vim

function! s:parse_json_file(jsonFile)
    let l:jsonFile = fnameescape(expand(a:jsonFile))
    if filereadable(l:jsonFile)
        let l:json_string = join(readfile(l:jsonFile, "b"), "")
        return pyeval('json.loads(vim.eval("l:json_string"))')
    endif
endfunction

function! neobundle_packages#parse_bundle(bundle)
    if !exists('*neobundle#get_neobundle_dir')
        echom "Cannot detect Neobundle dir"
        return 0
    endif

    let jsonFile = neobundle#get_neobundle_dir() . s:pluginDir . a:bundle . '.json'
    let bundle = s:parse_json_file(l:jsonFile)
    if !exists("bundle.repository")
        echom "Failed to load bundle ". a:bundle
        return
    endif
    let params = {'lazy' : bundle.lazy, 'autoload' : bundle.autoload}
    let compiledBundle = string(bundle.repository) . "," . string(params)
    execute 'NeoBundle ' . compiledBundle
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
