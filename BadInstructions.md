Bad Instructions
================
During the course project and while reviewing others' work I was quite annoyed by the unspecific and even contradictory instructions.

My basic request is that the instructions at various places and the questions at the review prompt should match as exactly as possible and that all requirements should be in the first instructions a user views.

The project was fun and it is sad to be irritated by such unnecessary oversights, so here are my objections and suggestions for improvement:

1) The source:
---------------

__A) Instructions:__

> _Review criteria_
>
> 3\. GitHub contains a __code book__ that modifies and updates the available codebooks with the data to _indicate all the variables and summaries calculated_, along with units, and any other relevant information.
>
> 4\. The __README__ that _explains the analysis files_ is clear and understandable. ...
>
> _Getting and Cleaning Data Course Project_
>
> You will be required to submit: 1) a __tidy data set__ as described below, 2) a link to a Github repository with your __script__ for performing the analysis, and 3) a __code book__ that _describes the variables, the data, and any transformations or work that you performed to clean up the data_ called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

__B) Submit prompt__

> Please upload the __tidy data set__ _created in step 5 of the instructions_. Please upload your data set as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).
>
> Please submit a link to a Github repo with the code for performing your analysis. The code should have __a file run_analysis.R__ in the main directory that can be run as long as the Samsung data is in your working directory. The __output__ should be _the tidy data set you submitted_ for part 1. You should include a __README.md__ in the repo _describing how the script works_ and the __code book__ _describing the variables_.

__C) Review prompt__

> Please submit a link to a Github repo with the code for performing your analysis. The code should have __a file run_analysis.R__ in the main directory _that can be run as long as the Samsung data is in your working directory_. The __output__ should be the _tidy data set you submitted_ for part 1. You should include a __README.md__ in the repo _describing how the script works_ and the __code book__ _describing the variables_
> Was code book submitted to GitHub that modifies and updates the codebooks available to you with the data to indicate all the variables and summaries you calculated, along with units, and any other relevant information?
> I was able to follow the README in the directory that explained what the analysis files did.

2) The irritation
-----------------
The instructions seem to tell me that I should write a code book about the variables, the data AND the computations, and a readme about the files in my repo (i.e. analysis) and that I have to submit a tidy data set derived by the analysis.  I assume that by 'tidy data set' they mean a file containg the data set or else I coundn't submit it. Also, the lecture was quite explicit that the recipie (i.e. my code) transforms the raw data file(s) into the tidy data file(s), but that is not explicit here.
I am not sure why there is talk about 'scripts' (plural) and how the 'repo explains' anything, as it is just a container for the files. My first thought was that it was an error, and the README was supposed to explain "how all of the scripts work and how they are connected," which would make more sense.

During the submit there is, suddenly, a specific format in which to upload the processed data. Since that was never mentioned before I had to change my code and readme, just because the instruction came in the last second.
At the submit prompt it is specifically defined that the script needs to output the tidy data set.
In contradiction to the instructions above, the readme should now describe the code, i.e. transformations, while the code book only describes the variables, which means that I need to change my codebook and readme as well to fit the new instruction. At least in the review these requirements are repeated, but I am confused by "the README in the directory that explained what the analysis files did." There is only one file that _did_ something (i.e. the script), but then it might be interpreted as the readme working as an index for the files.

3) The solution:
------------------
Write one instruction only and derive the formulations from there. This looks too much as if there were two different authors or versions.

Also, a simple style sheet to follow for the composition of codebook, readme and variable names would have prevented much of the confusion and help requests in the forum.
