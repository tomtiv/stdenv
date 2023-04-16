#!/bin/zsh
# Written 7/22/20 by Jake Gearon; jake.gearon@gmail.com


NOTESDIR="$HOME/.notes"

if [[ ! -e $NOTESDIR ]]; then
  mkdir -p $NOTESDIR
  y_day=$(date +"%m-%d-%y" --date="yesterday")
  # y_day=$(date -v-1d +"%m-%d-%y")
  local day_path
  day_path="$NOTESDIR/"$y_day".txt"
  touch $day_path
  chmod +x $day_path
  fold -w 80 -s $day_path
  echo " created zshnotes " >> $day_path
  cat "$day_path"
fi

note_submit() {
    local cur_time
    cur_time="$(date +"%r"): "
    local cur_day
    cur_day=$(date +"%m-%d-%y")
    local day_path
    day_path="$NOTESDIR/"$cur_day".txt"

    task=$(echo -E "$@" | tr '\n' '\000' | sed 's:\x00\x00.*:\n:g' | tr '\000' '\n')

    if [[ ! -e $day_path ]]; then
        mkdir -p $NOTESDIR
        touch $day_path
        chmod +x $day_path
        fold -w 80 -s $day_path
        echo "##########################################################" >> $day_path
        echo "############### DAILY NOTES FOR" $cur_day "################" >> $day_path
        echo "##########################################################\n" >> $day_path
        echo "$cur_time $task" >> $day_path
        echo "--" >> $day_path

    else
        echo "$cur_time $task"  >> $day_path
        echo "--" >> $day_path
    fi
}
autoload -U note_submit
alias note=note_submit

note_read() {
  local cur_day
  cur_day=$(date +"%m-%d-%y")
  local day_path
  day_path="$NOTESDIR/"$cur_day".txt"
  if [[ ! -e $day_path ]]; then
        mkdir -p $NOTESDIR
        touch $day_path
        chmod +x $day_path
        fold -w 80 -s $day_path
        echo "##########################################################" >> $day_path
        echo "############### DAILY NOTES FOR" $cur_day "################" >> $day_path
        echo "##########################################################\n" >> $day_path
        cat "$day_path"
  else
        cat "$day_path"
  fi
}
alias cnote=note_read
autoload -U note_read

note_read_yest() {
  local cur_day
  y_day=$(date +"%m-%d-%y" --date="yesterday")
  # y_day=$(date -v-1d +"%m-%d-%y")
  local day_path
  day_path="$NOTESDIR/"$y_day".txt"

  cat $day_path
}
alias ynote=note_read_yest
autoload -U note_read_yest
