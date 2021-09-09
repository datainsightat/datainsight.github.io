# Application Architecture

![Shiny Architecture](https://datainsightat.github.io/wiki/pages/_img/Shiny_Golem_App_Architecture.drawio.svg)

The user interacts with the dataset using the application interface 'app_ui.R'. All features are encapsulated in modules (mod_1.R, mod_2.R). All changes in the user interface are stored in a reactive list. Changes to this list affect the display elements in the user interface. The list is stored in the database. The result of the app is stored in the database.

# Initialize Application

The golem package sets up the datastructure for the application.

## Golem general

[Cheatsheet](https://thinkr.fr/golem_cheatsheet_V0.1.pdf)  
[Detailed Manual](https://engineering-shiny.org/golem.html)

## Setup

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
    
## 1st Run Golem Application

    > /dev/run_dev.R
    
## Add Content to App (Modules)

    > golem::add_module(name = "mod_1")
    > golem::add_module(name = "mod_2")
