url_checker() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            echo -e "\e[31m[!] Invalid URL. Please use http or https.\e[0m"
            exit 1
        fi
    fi
}

echo -n "Paste URL here (with http or https): "
read phish
url_checker $phish
sleep 1
echo ""
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo 'Domain to mask original URL (with http or https):'
read mask
url_checker $mask
echo -e '\nType any words you want to be in the url:'
echo -e "\e[31mDon't use space just use '-' between words\e[0m"
read words
echo -e "\nGenerating Link...\n"
final=$mask-$words@$shorter
echo -e "URL:\e[32m ${final} \e[0m\n"
sleep 5d
echo ""
