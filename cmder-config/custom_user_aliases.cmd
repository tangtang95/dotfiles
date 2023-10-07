vi=nvim $*
vim=nvim $*  
ls=eza $*  
paste=powershell -command "Get-ClipBoard"
cdws=cd "%MY_WORKSPACE%"
aws-cp=paste | cat > "%USER_PROFILE%/.aws/credentials"
