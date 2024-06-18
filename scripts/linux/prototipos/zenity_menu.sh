#!/bin/bash

function item01(){
    clear
    echo "<<< ETAPA 01 >>>"
    echo "."
    echo "Selected $item, item #1"
}

function item02(){
    clear
    echo "<<< ETAPA 02 >>>"
    echo "."
    echo "Selected $item, item #2"
}

function item03(){
    clear
    echo "<<< ETAPA 03 >>>"
    echo "."
    echo "Selected $item, item #3"
}

function error(){
    clear
    echo "<<< ERROR >>>"
    echo "."
    echo "Ooops! Invalid option."
}

items=("Item 1" "Item 2" "Item 3")

while item=$(zenity --title="$title" --text="$prompt" --list --column="Etapas" "${items[@]}")
do
    case "$item" in
        "${items[0]}") item01;;
        "${items[1]}") item02;;
        "${items[2]}") item03;;
        *) error;;
    esac
done