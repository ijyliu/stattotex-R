# demo.R
# This file demonstrates how to use the stattotex package.

##################################################################################################

# In R

# Load the stattotex package
library(stattotex)
# The below package is a dependency for compiling LaTeX documents within R (optional).
library(tinytex)
# If "demo" is a subdirect, change into it
if (basename(getwd()) != "demo") {
  setwd("demo")
}

# Suppose we had some calculated statistic/variable. 
# For example, we could compute average monthly sales for a product over the previous quarter. 
# Suppose that this statistic takes on the value of 2,532.01 units.
number <- 2532.01

# Let us now save this number to the file "demoNums.tex" with the name "AvgMonthlySales". 
# We can use the setting clear_file=TRUE to delete the file before writing to it.
stattotex(variable_name="AvgMonthlySales", 
          variable_value=number, 
          filename="demoNums.tex", 
          clear_file=TRUE)

# Let's say we wish to format this as 2,532.01. 
# We can directly format the number as a string, and feed strings to stattotex.
f_number <- formatC(number, format = "f", digits = 2, big.mark = ",")
# This function call will update the value of the number for LaTeX.
stattotex("AvgMonthlySales", f_number, "demoNums.tex")

# stattotex will accept arbitrary string inputs. 
# Let's say our sales increased by 100.3% from the previous quarter
pct <- 100.3
pct_string <- paste0(as.character(pct), "%")
stattotex("SaleIncPct", pct_string, "demoNums.tex")
# and we want to say that the sales increased/decreased/stayed the same based on the percentage
if (pct > 0.0) {
  word <- "increased"
} else if (pct == 0.0) {
  word <- "stayed the same"
} else {
  word <- "decreased"
}
stattotex("SaleDir", word, "demoNums.tex")

##################################################################################################

# In LaTeX

# We can now compile a document making use of these numbers. 
# I am doing this in R for convenience, but you can also do this directly via other means.
# Check out the `Demo Report.tex` file in this folder, and the associated `Demo Report.pdf` created.
if (!is_tinytex()) {
  install_tinytex() 
}
pdflatex('Demo Report.tex')
