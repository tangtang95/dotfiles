vim=nvim $*  
ls=eza $*  
paste=powershell -command "Get-ClipBoard"
aws-cp=paste | cat > "%USER_PROFILE%/.aws/credentials"
