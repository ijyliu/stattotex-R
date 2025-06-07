# stattotex-R

A simple function for automatically updating LaTeX documents with numbers or strings from R. No more manually copying your calculations over every time your code is re-run!

Inspired by the Stata package isapollnik/stattotex.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Installation

```
library(devtools)
devtools::install_github("ijyliu/stattotex-R")
```

## Usage

For examples, see [demo.R](https://github.com/ijyliu/stattotex-R/blob/main/demo/demo.R) and [Demo Report.tex](https://github.com/ijyliu/stattotex-R/blob/main/demo/Demo%20Report.tex) in the broader [demo](https://github.com/ijyliu/stattotex-R/blob/main/demo) folder. A summary is below:

In R, import the function with

```
library(stattotex)
```

and use it with

```
stattotex(variable_name, variable_value, filename, clear_file)
```

where `variable_name` is a name you want to assign to the variable in LaTeX (note that you may not include underscores), `variable_value` is a number or string, `filename` is a file path string to save the variable to, and `clear_file` is an optional TRUE/FALSE flag to delete a pre-existing file.

Then, in your LaTeX document, put

```
\input{<your filename>}
```

in the preamble and add your variable with

```
\<your variable_name>
```

You may find it helpful to insert `\space` afterwards (`\<your variable_name> \space`) to correct the spacing.
