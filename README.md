# docker_install_ole
instalação docker proxy e encoder
Para instalação do proxy e do encoder, é aconselhado o uso do Ubuntu 18.05 ou 20.04 limpo, sem nenhuma instalação extra, a versão 22.04 contem muitos problemas de pacotes

** 1 - Instalação de encoder, ele irá instalar todos os driver do encoder para placa de vídeo atualizados, ao finalizar reinicie o servidor
server#: sh install_docker.sh

acesse via web:
http://[ip_do_servidor]:280/0/
Usuário: admin
Senha: [solicite a senha]

** 2 - Instalação do proxy, é uma instalação mais simples e rápida
server#: sh istall_proxy.sh

acesse via web:
http://[ip_do_servidor]:280/proxy/
Usuário: admin
Senha: [solicite a senha]
