#!/bin/bash
# Tags designed for android projects using this jni and C++
find . -type f|egrep "\.(h|cpp|java|aidl|xml)$" > .tagindex;
# create C++ & Java tags from the list
ctags --tag-relative=yes --languages=C++,java -L .tagindex $JAVA_HOME
rm .tagindex;
