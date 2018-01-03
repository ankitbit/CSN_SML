# PROJECT 2: THE SCALING OF THE MEAN EDGE LENGTH IN SYNTACTIC DEPENDENCY TREES


This project will consist of a new version of lab session 4 that will 
include: new functions to fit 
(a logarithmic function, an updated
dataset (including more languages) and new data filters to improve the
quality of the results.
 The target of the analysis is the mean edge
length.  

### Defined Objectives
* Process the datasets and create directory of files suitable for fitting non-linear regression models.
* Understand and fit each model turn by turn and then advanced versions of each model
* present a publishable article instead of a traditional research report.

New dataset: see file readme.txt. 

New functions to fit:  

   f(n) = a \log(n + d_1) (model 4), a logarithmic model.
 The motivation of this model comes from Esteban et al (2015) (see folder references)
    
   f(n) = a \log(n + d_1) + d_2 (model 4+).

  
 (adopted as in lab session 6) 
   
New data filters: 

   
The goal of the new filters is to evaluate the robustness of the best models (we may consider alternative robustness tests). 

  
 The use of aggregate is mandatory (see lab session 2). 

   For every treebanks, the results of the analysis will have to be compared against 
   
(a) those where values of n taken by just k trees or less have been removed. k = 1 and k = 2 will be used. 
  
 (b) those where values trees with n exceeding a certain n_max (to be determined) have been removed.
   
Tily's PhD thesis (Chapter 3): "I excluded any sentences that were longer than 80 words in length (just under 0.2% of the data).
"
 
Further analyses: 

   The use a rigorous homoscedasticity test if mandatory (a visual test does not suffice here).
  
 Recall message at Raco "test for homoscedasticity". 

  
 Pending issues from the original report of lab session 3 (to be completed?)
 

Deliverables: 

   Besides the project report, a prepocessed dataset, i.e. a text file for every treebank. 
 
  The file name has to follow the format language_collection_dependency_tree_metrics.txt,
  
 where language is the language as described in the *list.txt files and collection is "Prague" or "Stanford". 
   
The content of the file has to be the same as the treebank files
 but the vector of every sentence is  replaced by three numbers 

   n K D
  
   where n is the number of vertices of the tree, 
K is the sum of squared degrees and D is the sum of depedency lengths (the format is similar but not the same as the materials of lab session 2). 


## Accomplished Objectives
* Creating of a processed directory of data files that contain metrices relevant for fitting a non-linear regression model. These metrices have to be "mean edge length" and "Second degree moment". 
* Fitting of models 
