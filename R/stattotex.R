#' stattotex
#'
#' Function that takes a variable value and associated name from R and saves into a file that allows for easy-read-in and later formatting in LaTeX
#'
#' @param variable_name Name of the variable to be saved (string)
#' @param variable_value Value of the variable to be saved
#' @param filename Name of the file to save the variable to (string)
#' @param clear_file If TRUE, clears the contents of the file before writing (default is FALSE)
#' @examples
#' \dontrun{stattotex(variable_name = "AvgMonthlySales", 
#'                    variable_value = 1500, 
#'                    filename = "demo/demoNums.tex", 
#'                    clear_file = FALSE)}
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
