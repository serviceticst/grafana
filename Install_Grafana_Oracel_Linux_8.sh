#!/bin/bash
#------------------------------------------------
#   INSTALACAO AUTOMATIZADA GRAFANA NO ORACLE LINUX 8
#------------------------------------------------
#
#  Desenvolvido por: Service TIC Solucoes Tecnologicas
#            E-mail: contato@servicetic.com.br
#              Site: www.servicetic.com.br
#          Linkedin: https://www.linkedin.com/company/serviceticst
#          Intagram: https://www.instagram.com/serviceticst
#          Facebook: https://www.facebook.com/serviceticst
#           Twitter: https://twitter.com/serviceticst
#           YouTube: https://youtube.com/c/serviceticst
#
#          Tutorial: https://www.youtube.com/watch?v=iBBzYSutBHg&t
#              Blog: https://servicetic.com.br/grafana-instalacao-automatizada-no-oracle-linux-8
#-------------------------------------------------
#
echo "#--------------------------------------------------------#"
echo                "ADICIONANDO REPOSITORIO"
echo "#--------------------------------------------------------#"
cat <<EOF | sudo tee /etc/yum.repos.d/grafana.repo
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF
#
echo "#--------------------------------------------------------#"
echo                "ATUALIZANDO CACHE"
echo "#--------------------------------------------------------#"
dnf makecache -y
#
echo "#--------------------------------------------------------#"
echo              "INSTALANDO GRAFANA SERVER"
echo "#--------------------------------------------------------#"
dnf -y install grafana && rpm -qi grafana
#
echo "#--------------------------------------------------------#"
echo    "ADICIONANDO START DO SERVICO AO REINICIAR O SERVIDOR" 
echo                 "REINICIANDO SERVICO"                     
echo "#--------------------------------------------------------#"
systemctl enable --now grafana-server.service
systemctl restart grafana-server
#
echo "#--------------------------------------------------------#"
echo             "LIBERANDO PORTA 3000 NO FIREWALL"
echo "#--------------------------------------------------------#"
firewall-cmd --add-port=3000/tcp --permanent
firewall-cmd --reload
#
echo "#--------------------------------------------------------#"
echo             "LIBERANDO PORTA 3000 NO FIREWALL"
echo "#--------------------------------------------------------#"
firewall-cmd --add-port=3000/tcp --permanent
firewall-cmd --reload
#
echo "#--------------------------------------------------------#"
echo             "ACESSE: HTTP://IP-DO-SERVER:3000"
echo                          "FIM"
echo "#--------------------------------------------------------#"
