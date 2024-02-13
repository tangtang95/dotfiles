@echo off

doskey clear=cls
doskey e.=explorer .
doskey find=fd $*
doskey ls=exa $*
doskey paste=powershell -command \"Get-ClipBoard\"
doskey vi=nvim $*
doskey vim=nvim $*
