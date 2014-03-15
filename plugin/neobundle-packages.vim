function! s:ParseJsonFile(json_file)
    let b:json_file = fnameescape(expand(a:json_file))
    if filereadable(b:json_file)
        let b:json_string = join(readfile(b:json_file, "b"), "")
        python import json,vim
        return pyeval('json.loads(vim.eval("b:json_string"))')
    endif
endfunction

function! NeoBundlePackage#ParseBundle(bundle_path, bundle)
    let bundle = ParseJsonFile(a:bundle_path . 'neobundle-packages/' .  a:bundle . '.json')
    if !exists("bundle.repository")
        echom "Failed to load bundle ". a:bundle
        return
    endif
    let params = {'lazy' : bundle.lazy, 'autoload' : bundle.autoload}
    execute 'NeoBundle ' . string(bundle.repository) . "," . string(params)
endfunction
