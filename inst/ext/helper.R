
## lintr
lintr::lint("index.qmd")
lintr::lint_dir("chapters/")

## spell checking
spells <- NULL
for (fl in dir(pattern = "*.qmd", recursive = TRUE, full.names = TRUE)) {
  spell <- spelling::spell_check_files(fl, ignore = readLines("inst/WORDLIST"))
  spells <- rbind(spells, spell)
}

## update WORDLIST
writeLines(
  unique(spells$word),
  "inst/WORDLIST"
)
