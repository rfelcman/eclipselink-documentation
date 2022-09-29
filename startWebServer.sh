#!/bin/bash

export JAVA_HOME=/usr/local/jdk19.0
$JAVA_HOME/bin/jwebserver -b localhost -p 7777 -d /home/felda/work/EclipseLinkProjects/eclipselink-documentation/target/site
