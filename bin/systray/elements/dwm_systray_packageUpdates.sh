#!/bin/sh

updates=$(checkupdates | wc -l)

echo -e "\uf8d5 $updates"
