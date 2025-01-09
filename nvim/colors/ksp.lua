for k in pairs(package.loaded) do
    if k:match(".*ksp.*") then package.loaded[k] = nil end
end

require('ksp').setup()
require('ksp').colorscheme()
