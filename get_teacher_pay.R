# get_teacher-pay.R

################################################################################
# Prepare environment for required functions
################################################################################

require( tidyverse )                        # I live in the tidyverse.
require( here )                             # For universal location support

get_teacher_pay <-
  function(){
    root <- here()                          # Find directory structure
    
    ############################################################################
    # Read the teacher salary data
    ############################################################################
    
    source <- file.path( this_here,
                         "data",
                         "TeacherSalaries2022.csv")
    Salaries <- read_csv( source ) %>% 
      arrange( state )
    
    ############################################################################
    # Read the cost of living data
    ############################################################################
    
    source <- file.path( this_here,
                         "data",
                         "COLA.csv")
    Cola <- read_csv( source ) %>% 
      select( state, cola ) %>% 
      arrange( state )
    
    Cola
    
    ############################################################################
    # In this step we:
    # 
    # 1. Use an inner-join to attach the cost of living table to the teacher pay
    #    table.
    #
    # 2. Compute the cost of living adjusted teacher pa.
    # 
    # 3. We keep the state name the teacher pay, the cola, and the adjusted
    #    teacher pay.
    ############################################################################
    
    Adjusted <-
      Adjusted %>% 
      mutate( adjustedTeacherPay = teacherPay / (cola / 100)) %>% 
      select( state,teacherPay, cola, adjustedTeacherPay )
    
    Adjusted
  }