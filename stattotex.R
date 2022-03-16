# Function that takes number and associated name from R and saves into a file that allows for easy-read-in and later formatting in LaTeX
stattotex <- function(number, number_name, filename) {

  # Paste together command
  command <- paste0("\\newcommand{\\", number_name, "}{", number, "}")

  # Write to file
  cat(command, sep = "\n", file = filename, append = TRUE)

}
