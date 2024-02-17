@echo off

doskey clear=cls
doskey e.=explorer .
doskey find=fd $*
doskey ls=exa $*
doskey pbpaste=powershell -command Get-ClipBoard
doskey pbcopy=clip
doskey vi=nvim $*
doskey vim=nvim $*
