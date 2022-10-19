REM Copy .emacs
xcopy .emacs.d %appdata%\.emacs.d

winget install --id Git.Git -e --source winget