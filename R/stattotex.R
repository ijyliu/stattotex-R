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
stattotex <- function(variable_name, variable_value, filename, clear_file = FALSE) {

  # Convert variable_value to character
  # Escape the '%' character for LaTeX
  variable_value <- gsub("%", "\\\\%", as.character(variable_value))

  # Throw an error if variable_name contains an underscore
  if (grepl("_", variable_name, fixed = TRUE)) {
    stop("variable_name cannot contain an underscore. LaTeX does not allow this.")
  }

  # Delete the file if clear_file is TRUE
  if (clear_file && file.exists(filename)) {
    file.remove(filename)
  }

  # Determine whether to use \\newcommand or \\renewcommand
  command_string <- paste0("\\newcommand{\\", variable_name, "}")
  use_renew <- FALSE
  # Existing file with string - use \\renewcommand
  if (file.exists(filename)) {
    lines <- readLines(filename, warn = FALSE)
    if (any(grepl(command_string, lines, fixed = TRUE))) {
      use_renew <- TRUE
    }
  }
  
  # Construct the LaTeX command
  command <- if (use_renew) {
    paste0("\\renewcommand{\\", variable_name, "}{", variable_value, "}")
  } else {
    paste0(command_string, "{", variable_value, "}")
  }

  # Write the command to the file
  cat(command, "\n", file = filename, append = TRUE)
}
