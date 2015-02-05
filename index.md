---
title       : Hospital Ranking
subtitle    : Data analysis using the hospital data
author      : Lakshmi
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Dataset and Problem Statement

1. The dataset used in this analysis is taken from the sample data provided in the R programming course.
2. This data is a collection of different hospitals from different states and their metrics for a given speciality
3. The problem statement here is to rank all the hospitals based on the required speciality





--- .class #id 

## Project

1. Based on the given metrics, the hospitals are sorted for a given speciality for different states.
2. The hospitals are ranked based on the mortality rate for a given speciality.
3. The results are stored as ranks for a particular speciality in a given state.

--- .class #id

## Execution

1. In the shinyapp, the inputs given are : state, specialty and rank.
2. The shinyapp would give the hospital name that matches the given criterea. 
3. The code is executed here to print the best hospital in Alabama for 'pnemonia'

--- .class #id




```r
best("AL",'pneumonia')
```

```
## [1] "MARSHALL MEDICAL CENTER NORTH"
```


