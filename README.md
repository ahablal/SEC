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
  
  
   |                  |Time                      | Allocations |
   |:-----------------|:------------------------:|:------------------------:|
   |Tot / % measured: |       29.7s /  91.2%     |      1.12GiB /  97.8%    |

  | fonction                                                      | ncalls |  time  |  %tot  |   avg    |   alloc   |   %tot   |   avg   |
  |:--------------------------------------------------------------|:------:|:------:|:------:|:--------:|:---------:|:--------:|:-------:| 
  | Totale                                                        |   1    | 3.96s  | 100.0% | 3.96s    |  110MiB   | 100.0%   | 110MiB  |
  | Calcul de la SEC du graphe : sec & P                          |   1    | 3.34s  | 84.3%  |  3.34s   | 79.8MiB   |  72.8%   | 79.8MiB |
  | Calcul de l'ensemble minimal d'arêtes à supprimer : coupe_min |   1    | 590ms  | 14.9%  |  590ms   |  28.9MiB  |  26.4%   | 28.9MiB |
  | Affichage de l'ensemble minimal d'arêtes à supprimer: edges   |   1    | 33.0ms |  0.8%  |  33.0ms  |  956KiB   |   0.9%   | 956KiB  |  

  
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

* **BONUS :**

Concernant le bonus, il a été impossible de calculer le sec pour un graphe de 1000 nœuds. Le programme est trop gourmand en RAM.

Le résultat obtenus est pour un graphe de 250 nœuds, avec un temps d'exécution de plus de 40 mn.

Vous pouvez accéder au bench dans le dossier dédier.
