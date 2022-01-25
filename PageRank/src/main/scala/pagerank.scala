/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// scalastyle:off println
// $example on$
import org.apache.spark.graphx.GraphLoader
// $example off$
import org.apache.spark.sql.SparkSession

object PageRankWiki {
  def main(args: Array[String]): Unit = {
    // Creates a SparkSession.
    val spark = SparkSession
      .builder
      .appName(s"${this.getClass.getSimpleName}")
      .getOrCreate()
    val sc = spark.sparkContext

    // $example on$
    // Load user id-name list
    val users = (sc.textFile("data/users.txt").map(line => line.split(",")).map( parts => (parts.head.toLong, parts.last) ))
    // Load the graph
    val graph = GraphLoader.edgeListFile(sc, "data/wiki-vote.txt")
    // Attach name to graph
    val namedgraph = graph.outerJoinVertices(users) {
        case (uid, deg, Some(name)) => name
        case (uid, deg, None) => ""
    }
    // Compute the pagerank
    val ranksGraph = graph.pageRank(0.0001)
    
    // Get the name of the top pagerank users
    var userswithrank = namedgraph.outerJoinVertices(ranksGraph.vertices) {
        case (uid, name, Some(pr)) => (pr, name)
        case (uid, name, None) => (0.0, name)
    }
    
    var top = userswithrank.vertices.top(20)(Ordering.by(_._2._1))
    var printContent = top.map{case (uid, (pr, name)) => f"PR: $pr%2.2f, ID:$uid%4d, Name:$name%s"}
    
    // Print the result
    println(printContent.mkString("\n"))
    spark.stop()
  }
}
// scalastyle:on println
