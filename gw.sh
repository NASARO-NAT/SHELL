#programa para auxiliar a config do gw


cd /usr/local/bin

nano gateway.sh

#!/bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat  -o enp0s3 -A POSTROUTING -j MASQUERADE


################################################################################
O PROGRAMA

CD /HOME/SCRIPTS

nano admgw.sh

#!/bin/bash
#AUTOR: NATALIA NASARO EMAIL : #
#VERSÃO: 1.0#
ufw enable
echo -n  "Entre com 1 para bloquear/desbloquear  2 para alterar interface: "

read OPC

if [ $OPC --eq 1 ]

then

  echo -n "0 -Bloquear 1 -Desbloquear: "
  read OPC
  if [$OPC -eq 0]
  
  then

      echo 0 > /proc/sys/net/ipv4/ip_forward
  
  elif [ $OPC -eq 1 ]

  then 
    echo 1 > /poc/sys/net/ipv4/ip_forward

  else
   
   echo "Opção inválida"

   fi

   elif [ $OPC -eq 2 ]
   
   then
 
   echo "Entre com o nome da interface : "
   read NIF
   
   iptables -t nat - F #(O F apaga as regras de nat)#
  
  iptables -t nat -o $NIF -A POSTROUTING -j MASQUERADE

  iptables -t nat -L #(O L mostra as regras de nat)#

  else

 "Opção inválida"


  fi

##################################################################################

ufw #( antes da regra de fire precisa habilitar)#

#################################################################################

chmod +x admgw.sh

./admgw.sh

################################################################################
