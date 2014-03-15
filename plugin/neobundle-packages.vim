if v:version < 704
  finish
endif

let s:save_cpo=&cpo
set cpo&vim

let s:pluginDir = 'packages/'

function! s:ParseJsonFile(jsonFile)
    let l:jsonFile = fnameescape(expand(a:jsonFile))
    if filereadable(l:jsonFile)
        let l:json_string = join(readfile(l:jsonFile, "b"), "")
        return pyeval('json.loads(vim.eval("l:json_string"))')
    endif
endfunction

function! s:ParseBundle(bundle_path, bundle)
    "TODO improve this and possibly get rid of bundles path
    let jsonFile = a:bundle_path . 'neobundle-packages/' . s:pluginDir .  a:bundle . '.json'
    let bundle = s:ParseJsonFile(l:jsonFile)
    if !exists("bundle.repository")
        echom "Failed to load bundle ". a:bundle
        return
    endif
    let params = {'lazy' : bundle.lazy, 'autoload' : bundle.autoload}
    let compiledBundle = string(bundle.repository) . "," . string(params)
    execute 'NeoBundle ' . compiledBundle
endfunction

if !exists(":NeoBundle")
    echom "Please load NeoBundle before.."
    finish
endif

if !exists(":NeoBundlePacakge")
    python json,vim
    command! -nargs=2 NeoBundlePackage call s:ParseBundle(<args>)
endif

let &cpo = s:save_cpo
