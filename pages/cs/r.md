# R

## Create R Package

### Install Devtools

    $ R
    R > install.packages("devtools")
    
### Create Local Package Directory

    $ R_LIBS=/path/to/Rlibs

### Build Package

    R > library devtools
    R > build()
    R > install()
    
### Install Package

    $ R CMD INSTALL --library=/path/to/Rlibs yourpackage_0.1.tar.gz
