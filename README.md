# Strong edge connectivity

Institutional project, Master 1  Informatique pour la science des données.

## Project
The project of the OR course consists of writing a Julia program using the JuMP library to solve
an optimization problem. The problem we address is an application of the max-flow problem. It consists
of finding a feature of a network, called the strong edge connectivity (SEC), which measures the fault
resistance of a network. In this document, we first present the graph problem and then describe the
program you will have to write. The project can be carried out in pairs (of 2 students).


## Démo

In julia run **demo.jl** file. You can change the graph in the demo file by choosing one in **common.jl** .

## Results

* **Graph 1 :** 
  * Remove edge from 25 to 1
  * Source = 26 - Target = 1
  * SEC = 1.0
  
* **Graph 2 :** 
    * Remove edge from 3 to 10
    * Remove edge from 6 to 10
    * Remove edge from 9 to 10
    * Remove edge from 11 to 10
    * Remove edge from 12 to 10
    * Remove edge from 13 to 10
    * Remove edge from 15 to 10
    * Remove edge from 17 to 10
    * Remove edge from 18 to 10
    * Remove edge from 20 to 10
    * Remove edge from 24 to 10
    * Remove edge from 26 to 10
    * Source = 9 - Target = 10
    * SEC = 12.0
