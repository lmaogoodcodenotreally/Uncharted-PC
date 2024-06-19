#!/bin/bash
CHOICE="tll"

display_menu() {
    clear
    echo "Choose an app to start:"
    case "$CHOICE" in
        "tll")
            echo "> tll"
            echo "  tll-l"
            echo "  u4"
            echo "  u4-l"
            ;;
        "tll-l")
            echo "  tll"
            echo "> tll-l"
            echo "  u4"
            echo "  u4-l"
            ;;
        "u4")
            echo "  tll"
            echo "  tll-l"
            echo "> u4"
            echo "  u4-l"
            ;;
        "u4-l")
            echo "  tll"
            echo "  tll-l"
            echo "  u4"
            echo "> u4-l"
            ;;
    esac
}

handle_input() {
    read -rsn1 input
    if [ "$input" == $'\x1b' ]; then
        read -rsn2 -t 0.1 input
        if [ "$input" == "[A" ] || [ "$input" == "[B" ]; then
            case "$CHOICE" in
                "tll")
                    CHOICE="tll-l"
                    ;;
                "tll-l")
                    CHOICE="u4"
                    ;;
                "u4")
                    CHOICE="u4-l"
                    ;;
                "u4-l")
                    CHOICE="tll"
                    ;;
            esac
        fi
    elif [ "$input" == "" ]; then
        case "$CHOICE" in
            "tll")
                ./tll.exe skiplogos
                ;;
            "tll-l")
                ./tll-l.exe skiplogos
                ;;
            "u4")
                ./u4.exe skiplogos
                ;;
            "u4-l")
                ./u4-l.exe skiplogos
                ;;
        esac
        echo "Press any key to continue..."
        read -n 1 -s
        exit 0
    fi
}

while true; do
    display_menu
    handle_input
done
