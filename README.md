# Cloud Computing 2021 Experiment

This folder contains Cloud Computing 2021 Experiment submission files. Please check `Report.pdf` for details.

## File Structure

-   `image-buildscript`:  For building custom mirror
-   `HuaweiCloud-openAPI`: For Creating Virtual Machines
-   `WordCount`: WordCount source file and results
-   `GraphX`: Connected Component sources
-   `PageRank`: Page Rank sources
-   `Report.pdf`: The report PDF file

## Run GraphX Connected Components

-   Copy the entire dir `GraphX` on to VM
-   run under `GraphX` : `sbt package`
-   upload two txt files onto HDFS `data/graphx` folder
-   run `spark-submit --class "org.apache.spark.examples.graphx.ConnectedComponentsExample"  target/scala-2.12/graphx-connected-component_2.12-1.0.jar`
-   See the results in STDOUT.

## Run PageRank

-   Copy the entire dir `PageRank` on to VM
-   run under `PageRank` : `sbt package`
-   upload three txt files onto HDFS `data` folder
-   run `spark-submit --class "PageRankWiki"  target/scala-2.12/graphx-pagerank-wiki-users_2.12-1.0.jar`
-   See the results in STDOUT.
