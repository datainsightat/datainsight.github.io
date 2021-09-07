# Golem

[Cheatsheet](https://thinkr.fr/golem_cheatsheet_V0.1.pdf)  
[Detailed Manual](https://engineering-shiny.org/golem.html)

# Setup

Create Project  

    RStudio > File > New Project > Package for Shiny App using golem

[Add Local Project to Github](../de/git.md#addlocalprojecttogithub)  

Edit /DESCRIPTION with your name and email.

Set golem global options  

    > golem::set_golem_options()
    
Add tests  

    > golem::use_recommended_tests()
    
Create test template  

    > golem::use_recommended_deps()
    
Add favicon. Path '/inst/app/www'
    
    > golem::favicon(
      ico = "favicon",
      ext = "png"
    )

Add UI related helper functions

    > golem::use_utils_ui()
    
Add Server related helper functions

    > golem::use_utils_server()
    
# 1st Run Golem Application

    > /dev/run_dev.R
    
# Add Content to App (Modules)

    > golem::add_module(name = "example")

