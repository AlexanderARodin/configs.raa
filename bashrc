# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
force_color_prompt=yes

last_slash() {
        if [ "$PWD" == '/' ]; then
                return
        else
                echo '/'
        fi
}
exit_result() {
        if [ $? == 0 ]; then
                return
        else
                echo -e  "\033[01;31m[E: $?]\033[00m"
        fi
}

PROMPT_COMMAND=construct_promtp
construct_promtp() {
        EXIT_STATUS=$(exit_result)
        PS1='\[\033[00;32m\]╭─\u@\h\[\033[00m\]:\[\033[01;34m\]\w$(last_slash)\[\033[00m\] $EXIT_STATUS
\[\033[00;32m\]╰─>\[\033[00m\]'
}

. "$HOME/.cargo/env"
