#!/bin/bash
clear
Menu() {
    clear
    echo -e '\n'
    echo "=========================="
    echo "  SLOWDNS VIVO BY RGNET   "
    echo "=========================="
    echo "       ============       "
    echo "          ======          "
    echo "            ==            "
    echo "__________________________"
    echo "[ 1 ] | INSTALAR SLOWDNS "
    echo "[ 2 ] | SLOWDNS GOOGLE"
    echo "[ 3 ] | SLOWDNS CLOUDFARE"
    echo "[ 4 ] | SLOWDNS OPENDNS"
    echo "[ 0 ] | SAIR"
    echo -e '\n'
    echo "RESPOSTA: "
    read opcao
    case $opcao in
    1) Opcao1 ;;
    2) Opcao2 ;;
    3) Opcao3 ;;
    4) Opcao4 ;;
    0) Sair ;;
    *) "Comando desconhecido" ; echo ; Menu;;
    esac
    }

Opcao1 () {
clear
echo "instalando o git..."
pkg install git -y > /dev/null 2>&1
echo "git instalado"
echo "instalando o go..."
pkg install golang -y > /dev/null 2>&1
echo "golang instalado"
echo "baixando o dnstt..."
git clone https://www.bamsoftware.com/git/dnstt.git > /dev/null 2>&1
echo "dnstt instalado"
touch ~/dnstt/dnstt-client/dns
echo "#!/bin/sh" >> ~/dnstt/dnstt-client/dns
echo "go build"  >> ~/dnstt/dnstt-client/dns
chmod  777 ~/dnstt/dnstt-client/dns
cd ~/dnstt/dnstt-client&&./dns /dev/null 2>&1&&mv dnstt-client ~
touch ~/server.pub
echo  > ~/server.pub
echo "784b9844675aa10467c1331d894933af0423f98f31554b1ef806d6a84e30ee3c" >> ~/server.pub
touch ~/dns
touch ~/dns1
touch ~/dns2
echo  > ~/dns
echo  > ~/dns1
echo  > ~/dns2
echo "#!/bin/bash" >> ~/dns
echo "#!/bin/bash" >> ~/dns1
echo "#!/bin/bash" >> ~/dns2
echo "./dnstt-client -udp 8.8.8.8:53   -pubkey 784b9844675aa10467c1331d894933af0423f98f31554b1ef806d6a84e30ee3c brabreadth.boxnetslowdns.com 127.0.0.1:2222 > /dev/null 2>&1" >> ~/dns
echo "./dnstt-client -udp 1.1.1.1:53   -pubkey 784b9844675aa10467c1331d894933af0423f98f31554b1ef806d6a84e30ee3c brabreadth.boxnetslowdns.com 127.0.0.1:2222" > /dev/null 2>&1 >> ~/dns1
echo "./dnstt-client -udp 208.67.222.222:53   -pubkey 784b9844675aa10467c1331d894933af0423f98f31554b1ef806d6a84e30ee3c brabreadth.boxnetslowdns.com 127.0.0.1:2222" > /dev/null 2>&1 >> ~/dns2
chmod 777 ~/dns
chmod 777 ~/dns1
chmod 777 ~/dns2
rm ~/dnstt/dnstt-client/dns > /dev/null 2>&1
clear
echo "#######################################"
echo "SLOWDNS INSTALADO"
echo " DESLIGUE O WIFFI LIGUE OS DADOS MOVEIS"
echo "SELECIONE EM VOLTAR E ESCOLHA AS OPÇÕES"
echo " DO DNS E DEPOIS LIGUE A VPN "
echo "#######################################"
    echo "O que deseja fazer?"
    echo "[ 1 ] Voltar"
    echo "[ 0 ] Sair"
    read opcao
    case $opcao in
    1) Voltar ;;
    0) Sair ;;
    *) "Comando desconhecido" ; echo ; Opcao1 ;;
    esac
}

Opcao2 () {
clear
./dns &>/dev/null &
    clear
    echo "DNS GOOGLE INICIADO CONECTE A VPN"
    echo "[ 0 ] Sair"
    read opcao
    case $opcao in
    0) Sair ;;
    *) "Comando desconhecido" ; echo ; Opcao2  ;;
    esac
}

Opcao3 () {
    clear
./dns1 &>/dev/null &
    clear
    echo "DNS CLOUDFARE INICIADO CONECTE A VPN"
    echo "[ 0 ] Sair"
    read opcao
    case $opcao in
    0) Sair ;;
    *) "Comando desconhecido" ; echo ; Opcao2  ;;
    esac
}

Opcao4 () {
clear
./dns2 &>/dev/null &
    clear
    echo "DNS OPENDNS INICIADO CONECTE A VPN"
    echo "[ 0 ] Sair"
    read opcao
    case $opcao in
    0) Sair ;;
    *) "Comando desconhecido" ; echo ; Opcao2  ;;
    esac
}


Voltar() {
clear
Menu
}

Sair() {
clear
pkill -f dns
pkill -f dns1
pkill -f dns2
exit
}
clear
Menu
