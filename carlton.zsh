# GenPW - custom password generator function
# Usage: genpw 20 (without special characters) or genpw 20 char (with special characters)
# Required pwgen, install with: brew install pwgen
# For further help: pwgen -h
genpw() {
  if [[ $2 == "char" ]]; then
    pwgen -Bcnsvy $1 1 | tr -d "\n" | pbcopy;
  else
    pwgen -Bcnsv $1 1 | tr -d "\n" | pbcopy;
  fi;
  echo -e "$(pbpaste)\nCopied to clipboard!"
}

# macOS
alias rm="${aliases[rm]:-rm} -vi"
alias cp="${aliases[cp]:-cp} -vi"
alias mv="${aliases[mv]:-mv} -vi"
alias grep="grep --color=auto"
alias rmds="find . -name '*.DS_Store' -type f -delete"
alias hosts="st /etc/hosts"
alias exports="st /etc/exports"
alias resetls="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -f -v -domain local -domain user -domain system"
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"
alias printdropboxconflict="find ~/Dropbox -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -print"
alias cleandropboxconflict="find ~/Dropbox -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -exec rm -f {} \;"

# Oh My Zsh and Carlton
alias ohmyzsh="cd ~/.oh-my-zsh"
alias carlton="cd ~/.carlton"

# MAMP
alias vhosts="st ~/Dropbox/Apps/MAMP/conf/apache/extra/httpd-vhosts.conf"

# Vagrant
alias vau="vagrant up"
alias vah="vagrant halt"
alias vas="vagrant status"
alias var="vagrant reload"
alias vaup="vagrant up --provision"
alias vass="vagrant ssh"
alias vabu="vagrant box update"

# Themes folder functions
cdbed() {
  cd web/app/themes/$1
}
cdwp() {
  cd wp-content/themes/$1
}

# Feltrinelli aliases
alias _feltrinelli-trellis="cd ~/Projects/feltrinelli/_trellis-feltrinelli"
alias fondazionefeltrinelli="cd ~/Projects/feltrinelli/fondazionefeltrinelli.it"
alias scuoladicittadinanzaeuropea="cd ~/Projects/feltrinelli/scuoladicittadinanzaeuropea.it"
