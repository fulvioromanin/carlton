# PWLen - custom password generator function
# Usage: pwlen 20 (without special characters) or pwlen 20 char (with special characters)
# Required pwgen, install with: brew install pwgen
# For further help: pwgen -h
pwlen() {
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
alias hosts="vsa /etc/hosts"
alias exports="vsa /etc/exports"
alias knownhosts="vsa ~/.ssh/known_hosts"
alias resetls="/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -seed -r -f -v -domain local -domain user -domain system"
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;"
alias lsdropbox="find ~/Dropbox\ \(Personale\) ~/Dropbox\ \(Ensoul\) -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -print"
alias cldropbox="find ~/Dropbox\ \(Personale\) ~/Dropbox\ \(Ensoul\) -path '*(Copia in conflitto di * [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]*' -exec rm -f {} \;"

# ssh-agent
alias lsssh="ssh-add -L"
alias clssh="ssh-add -D"
alias adssh="ssh-add -K ~/.ssh/id_rsa"

# Oh My Zsh and Carlton
alias ohmyzsh="cd ~/.oh-my-zsh"
alias carlton="cd ~/.carlton"


# Vagrant
alias vau="vagrant up"
alias vah="vagrant halt"
alias vas="vagrant status"
alias var="vagrant reload"
alias vap="vagrant provision"
alias vaup="vagrant up --provision"
alias vass="vagrant ssh"
alias vabu="vagrant box update"

# Visual Studio Code
alias vsls="code --list-extensions"

# General aliases and functions
alias proj="cd ~/Projects"
provision() {
  ansible-playbook server.yml -e env=$1
}
theme() {
  if [ -d "../site/web/app/themes/$1" ]; then
    cd ../site/web/app/themes/$1
    return
  fi
  if [ -d "site/web/app/themes/$1" ]; then
    cd site/web/app/themes/$1
    return
  fi
  if [ -d "web/app/themes/$1" ]; then
    cd web/app/themes/$1
    return
  fi
  if [ -d "wp-content/themes/$1" ]; then
    cd wp-content/themes/$1
    return
  fi
  echo "Theme folder doesn't exist!"
}
avm() {
  ACV=$(pip show ansible | grep Version | cut -d\  -f2)
  ANV=$1
  ANV_REGEX="^([0-9]\.[0-9]\.[0-9])"
  if [ "$ANV" == "" -o "$ANV" == "-v" -o "$ANV" == "-V" -o "$ANV" == "--version" -o "$ANV" == "v" -o "$ANV" == "V" -o "$ANV" == "version" ]; then
    echo "Ansible current version: $ACV"
    return
  fi;
  if [[ ! $ANV =~ $ANV_REGEX ]]; then
    tput setaf 1; echo "Incorrect entry '$ANV' (semantic versioning with three (>= 2.5.0) or four (< 2.5.0) digits)"
    return
  fi;
  if [ "$ACV" == "$ANV" ]; then
    tput setaf 1; echo "Version already installed (ansible-$ANV)"
    return
  fi;
  if [ "$ACV" != "" ]; then
    echo "Attempt to uninstall ansible-$ACV"
    pip uninstall -q -y ansible
    wait
    echo "Successfully uninstalled ansible-$ACV"
  fi;
  echo "Installing ansible-$ANV"
  pip install -q ansible==$ANV
  if [ $? -eq 0 ]; then
    echo "Successfully installed ansible-$ANV"
  fi;
}

# BAM aliases
alias bam="cd ~/Projects/bam.milano.it"

# Feltrinelli aliases
alias _feltrinelli-trellis="cd ~/Projects/feltrinelli/_trellis-feltrinelli"
alias fondazionefeltrinelli="cd ~/Projects/feltrinelli/fondazionefeltrinelli.it"
alias scuoladicittadinanzaeuropea="cd ~/Projects/feltrinelli/scuoladicittadinanzaeuropea.it"

# Davide Maule aliases
alias _davidemaule-trellis="cd ~/Projects/davidemaule/_trellis-davidemaule"
alias davidemaule="cd ~/Projects/davidemaule/davidemaule.com"
alias minerva="cd ~/Projects/davidemaule/minerva.davidemaule.com"
alias fedinuziali="cd ~/Projects/davidemaule/fedinuziali.ch"
alias anellidifidanzamento="cd ~/Projects/davidemaule/anellidifidanzamento.ch"
