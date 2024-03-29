#!/bin/bash
# Submit
falcon entity -type cluster -submit -file /mnt/workshop/falcon/storm-demo/demo-local/entity/primary-cluster.xml
falcon entity -type feed -submit -file /mnt/workshop/falcon/storm-demo/demo-local/entity/raw-data-feed.xml
falcon entity -type feed -submit -file /mnt/workshop/falcon/storm-demo/demo-local/entity/orc-data-feed.xml
falcon entity -type process -submit -file  /mnt/workshop/falcon/storm-demo/demo-local/entity/orc-conversion-process.xml
falcon entity -type process -submit -file  /mnt/workshop/falcon/storm-demo/demo-local/entity/solr-index-process.xml

# Schedule
falcon entity -type feed -schedule -name truck-events-raw-data-feed
falcon entity -type feed -schedule -name truck-events-orc-data-feed
falcon entity -type process -schedule -name orc-conversion-process
falcon entity -type process -schedule -name solr-index-process


