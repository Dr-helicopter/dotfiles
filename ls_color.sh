
export LS_COLORS='di=00;94:*.pdf=0;90;43:*.cbz=1;90;43:*.jpg=0;31;43:*.zip=1;30;100:*.xz=1;30;100'
if [[ $TERM = 'linux' ]]; then
	ls_video_col='0;101;44'
	ls_audio_col='1;37;46'
	zsh_suggestion_col='fg=0'
else
	ls_video_col='0;94;41'
	ls_audio_col='1;37;104'
	zsh_suggestion_col='fg=8'
fi

export LS_COLORS=$LS_COLORS:"*.mkv=$ls_video_col":"*.mp4=$ls_video_col:*.mp3=$ls_audio_col"

