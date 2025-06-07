#' stattotex
#'
#' Function that takes number and associated name from R and saves into a file that allows for easy-read-in and later formatting in LaTeX
#'
#' @param number A numeric value to be saved.
#' @param number_name A string representing the name/command to be associated with the number.
#' @param filename The name of the file where the LaTeX command will be saved.
#' @examples
#' \dontrun{stattotex("AvgMonthlySales", 1500, "demo/demoNums.tex")}
#' @export
stattotex <- function(number, number_name, filename) {

  # Paste together command
  command <- paste0("\\newcommand{\\", number_name, "}{", number, "}")

  # Make directory needed for file if it doesn't exist
  dir.create(dirname(filename), showWarnings = FALSE, recursive = TRUE)

  # Write to file
  cat(command, sep = "\n", file = filename, append = TRUE)

}
