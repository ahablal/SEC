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

                                Time                    Allocations
  |                  |  ─────────────────────── | ──────────────────────── |
  |:-----------------|:------:|:------:|
   |Tot / % measured: |       29.7s /  91.2%     |      1.12GiB /  97.8%    |

 | Section | ncalls  |  time  |  %tot  |  avg   |  alloc  |  %tot  |  avg   |
 |:--------|:-------:|:------:|:------:|:------:|:-------:|:------:|:------:| 
  |Totale  |       1 | 27.0s  | 100.0% | 27.0s  | 1.09GiB | 100.0% |  1.09GiB|
  |sec       |     1 | 23.5s  | 86.7%  | 23.5s  | 0.97GiB | 88.7%  |  0.97GiB|
  |coupe_min |     1 | 3.28s  | 12.1%  | 3.28s  | 123MiB  | 11.0%  |   123MiB|
  |edges     |     1 | 266ms  | 1.0%   | 266ms  | 2.54MiB | 0.2%   |  2.54MiB|  

  
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
