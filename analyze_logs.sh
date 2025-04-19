#!/bin/bash

{
    echo "Общее количество запросов: $(wc -l < access.log)"
    echo ""
    
    echo "Количество уникальных IP-адресов: $(awk '{print $1}' access.log | sort | uniq | wc -l)"
    echo ""
    
    echo "Количество запросов по методам:"
    awk -F'"' '{print $2}' access.log | awk '{print $1}' | sort | uniq -c | awk '{print "  " $2 ": " $1}'
    echo ""
    
    echo "Самый популярный URL:"
    awk -F'"' '{print $2}' access.log | awk '{print $2}' | sort | uniq -c | sort -nr | head -1 | awk '{print "  " $1 " " $2 ""}'
} > report.txt
